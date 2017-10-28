defmodule CassandraPlayground.CassandraTest do
  use CassandraPlayground.DataCase

  alias CassandraPlayground.Cassandra

  describe "playgroud" do
    alias CassandraPlayground.Cassandra.Playgroud

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def playgroud_fixture(attrs \\ %{}) do
      {:ok, playgroud} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cassandra.create_playgroud()

      playgroud
    end

    test "list_playgroud/0 returns all playgroud" do
      playgroud = playgroud_fixture()
      assert Cassandra.list_playgroud() == [playgroud]
    end

    test "get_playgroud!/1 returns the playgroud with given id" do
      playgroud = playgroud_fixture()
      assert Cassandra.get_playgroud!(playgroud.id) == playgroud
    end

    test "create_playgroud/1 with valid data creates a playgroud" do
      assert {:ok, %Playgroud{} = playgroud} = Cassandra.create_playgroud(@valid_attrs)
      assert playgroud.name == "some name"
    end

    test "create_playgroud/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cassandra.create_playgroud(@invalid_attrs)
    end

    test "update_playgroud/2 with valid data updates the playgroud" do
      playgroud = playgroud_fixture()
      assert {:ok, playgroud} = Cassandra.update_playgroud(playgroud, @update_attrs)
      assert %Playgroud{} = playgroud
      assert playgroud.name == "some updated name"
    end

    test "update_playgroud/2 with invalid data returns error changeset" do
      playgroud = playgroud_fixture()
      assert {:error, %Ecto.Changeset{}} = Cassandra.update_playgroud(playgroud, @invalid_attrs)
      assert playgroud == Cassandra.get_playgroud!(playgroud.id)
    end

    test "delete_playgroud/1 deletes the playgroud" do
      playgroud = playgroud_fixture()
      assert {:ok, %Playgroud{}} = Cassandra.delete_playgroud(playgroud)
      assert_raise Ecto.NoResultsError, fn -> Cassandra.get_playgroud!(playgroud.id) end
    end

    test "change_playgroud/1 returns a playgroud changeset" do
      playgroud = playgroud_fixture()
      assert %Ecto.Changeset{} = Cassandra.change_playgroud(playgroud)
    end
  end
end
