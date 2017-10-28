defmodule CassandraPlayground.PostgresTest do
  use CassandraPlayground.DataCase

  alias CassandraPlayground.Postgres

  describe "playgroud" do
    alias CassandraPlayground.Postgres.Playgroud

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def playgroud_fixture(attrs \\ %{}) do
      {:ok, playgroud} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Postgres.create_playgroud()

      playgroud
    end

    test "list_playgroud/0 returns all playgroud" do
      playgroud = playgroud_fixture()
      assert Postgres.list_playgroud() == [playgroud]
    end

    test "get_playgroud!/1 returns the playgroud with given id" do
      playgroud = playgroud_fixture()
      assert Postgres.get_playgroud!(playgroud.id) == playgroud
    end

    test "create_playgroud/1 with valid data creates a playgroud" do
      assert {:ok, %Playgroud{} = playgroud} = Postgres.create_playgroud(@valid_attrs)
      assert playgroud.name == "some name"
    end

    test "create_playgroud/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Postgres.create_playgroud(@invalid_attrs)
    end

    test "update_playgroud/2 with valid data updates the playgroud" do
      playgroud = playgroud_fixture()
      assert {:ok, playgroud} = Postgres.update_playgroud(playgroud, @update_attrs)
      assert %Playgroud{} = playgroud
      assert playgroud.name == "some updated name"
    end

    test "update_playgroud/2 with invalid data returns error changeset" do
      playgroud = playgroud_fixture()
      assert {:error, %Ecto.Changeset{}} = Postgres.update_playgroud(playgroud, @invalid_attrs)
      assert playgroud == Postgres.get_playgroud!(playgroud.id)
    end

    test "delete_playgroud/1 deletes the playgroud" do
      playgroud = playgroud_fixture()
      assert {:ok, %Playgroud{}} = Postgres.delete_playgroud(playgroud)
      assert_raise Ecto.NoResultsError, fn -> Postgres.get_playgroud!(playgroud.id) end
    end

    test "change_playgroud/1 returns a playgroud changeset" do
      playgroud = playgroud_fixture()
      assert %Ecto.Changeset{} = Postgres.change_playgroud(playgroud)
    end
  end
end
