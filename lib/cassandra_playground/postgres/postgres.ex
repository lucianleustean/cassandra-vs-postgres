defmodule CassandraPlayground.Postgres do
  @moduledoc """
  The Postgres context.
  """

  import Ecto.Query, warn: false
  alias CassandraPlayground.RepoPostgres

  alias CassandraPlayground.Postgres.Playground

  @doc """
  Returns the list of playground.

  ## Examples

      iex> list_playground()
      [%Playground{}, ...]

  """
  def list_playground do
    RepoPostgres.all(Playground)
  end

  @doc """
  Returns the list of latest n playground elements.

  ## Examples

      iex> list_playground(limit)
      [%Playground{}, ...]

  """
  def list_playground(10) do
    query = from p in Playground, limit: 10
    RepoPostgres.all(query)
  end

  def list_playground(limit) do
    query = from p in Playground, limit: ^limit
    RepoPostgres.all(query)
  end

  @doc """
  Gets a single playground.

  Raises `Ecto.NoResultsError` if the Playground does not exist.

  ## Examples

      iex> get_playground!(123)
      %Playground{}

      iex> get_playground!(456)
      ** (Ecto.NoResultsError)

  """
  def get_playground!(id), do: RepoPostgres.get!(Playground, id)

  @doc """
  Creates a playground.

  ## Examples

      iex> create_playground(%{field: value})
      {:ok, %Playground{}}

      iex> create_playground(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_playground(attrs \\ %{}) do
    %Playground{}
    |> Playground.changeset(attrs)
    |> RepoPostgres.insert()
  end

  @doc """
  Updates a playground.

  ## Examples

      iex> update_playground(playground, %{field: new_value})
      {:ok, %Playground{}}

      iex> update_playground(playground, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_playground(%Playground{} = playground, attrs) do
    playground
    |> Playground.changeset(attrs)
    |> RepoPostgres.update()
  end

  @doc """
  Deletes a Playground.

  ## Examples

      iex> delete_playground(playground)
      {:ok, %Playground{}}

      iex> delete_playground(playground)
      {:error, %Ecto.Changeset{}}

  """
  def delete_playground(%Playground{} = playground) do
    RepoPostgres.delete(playground)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking playground changes.

  ## Examples

      iex> change_playground(playground)
      %Ecto.Changeset{source: %Playground{}}

  """
  def change_playground(%Playground{} = playground) do
    Playground.changeset(playground, %{})
  end
end
