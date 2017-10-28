defmodule CassandraPlayground.Cassandra do
  @moduledoc """
  The Cassandra context.
  """

  import Ecto.Query, warn: false
  alias CassandraPlayground.RepoCassandra

  alias CassandraPlayground.Cassandra.Playgroud

  @doc """
  Returns the list of playgroud.

  ## Examples

      iex> list_playgroud()
      [%Playgroud{}, ...]

  """
  def list_playgroud do
    RepoCassandra.all(Playgroud)
  end

  @doc """
  Gets a single playgroud.

  Raises `Ecto.NoResultsError` if the Playgroud does not exist.

  ## Examples

      iex> get_playgroud!(123)
      %Playgroud{}

      iex> get_playgroud!(456)
      ** (Ecto.NoResultsError)

  """
  def get_playgroud!(id), do: RepoCassandra.get!(Playgroud, id)

  @doc """
  Creates a playgroud.

  ## Examples

      iex> create_playgroud(%{field: value})
      {:ok, %Playgroud{}}

      iex> create_playgroud(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_playgroud(attrs \\ %{}) do
    %Playgroud{}
    |> Playgroud.changeset(attrs)
    |> RepoCassandra.insert()
  end

  @doc """
  Updates a playgroud.

  ## Examples

      iex> update_playgroud(playgroud, %{field: new_value})
      {:ok, %Playgroud{}}

      iex> update_playgroud(playgroud, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_playgroud(%Playgroud{} = playgroud, attrs) do
    playgroud
    |> Playgroud.changeset(attrs)
    |> RepoCassandra.update()
  end

  @doc """
  Deletes a Playgroud.

  ## Examples

      iex> delete_playgroud(playgroud)
      {:ok, %Playgroud{}}

      iex> delete_playgroud(playgroud)
      {:error, %Ecto.Changeset{}}

  """
  def delete_playgroud(%Playgroud{} = playgroud) do
    RepoCassandra.delete(playgroud)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking playgroud changes.

  ## Examples

      iex> change_playgroud(playgroud)
      %Ecto.Changeset{source: %Playgroud{}}

  """
  def change_playgroud(%Playgroud{} = playgroud) do
    Playgroud.changeset(playgroud, %{})
  end
end
