defmodule CassandraPlayground.CassandraTest do
  use CassandraPlayground.DataCaseCassandra

  alias CassandraPlayground.Cassandra

  describe "playground" do
    alias CassandraPlayground.Cassandra.Playground

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def playground_fixture(attrs \\ %{}) do
      {:ok, playground} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cassandra.create_playground()

      playground
    end

    test "list_playground/0 returns all playground" do
      playground = playground_fixture()
      assert Cassandra.list_playground() == [playground]
    end

    # THIS FAILS
    test "list_playground/1 returns latest 5 playground resources" do
      playground = playground_fixture()
      assert Cassandra.list_playground(5) == [playground]
    end

    # THIS PASSES
    test "list_playground/1 returns latest n playground resources" do
      playground = playground_fixture()
      assert Cassandra.list_playground(10) == [playground]
    end

    test "get_playground!/1 returns the playground with given id" do
      playground = playground_fixture()
      assert Cassandra.get_playground!(playground.id) == playground
    end

    test "create_playground/1 with valid data creates a playground" do
      assert {:ok, %Playground{} = playground} = Cassandra.create_playground(@valid_attrs)
      assert playground.name == "some name"
    end

    test "create_playground/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cassandra.create_playground(@invalid_attrs)
    end

    test "update_playground/2 with valid data updates the playground" do
      playground = playground_fixture()
      assert {:ok, playground} = Cassandra.update_playground(playground, @update_attrs)
      assert %Playground{} = playground
      assert playground.name == "some updated name"
    end

    test "update_playground/2 with invalid data returns error changeset" do
      playground = playground_fixture()
      assert {:error, %Ecto.Changeset{}} = Cassandra.update_playground(playground, @invalid_attrs)
      assert playground == Cassandra.get_playground!(playground.id)
    end

    test "delete_playground/1 deletes the playground" do
      playground = playground_fixture()
      assert {:ok, %Playground{}} = Cassandra.delete_playground(playground)
      assert_raise Ecto.NoResultsError, fn -> Cassandra.get_playground!(playground.id) end
    end

    test "change_playground/1 returns a playground changeset" do
      playground = playground_fixture()
      assert %Ecto.Changeset{} = Cassandra.change_playground(playground)
    end
  end
end
