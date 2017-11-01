defmodule CassandraPlayground.Cassandra.Playground do
  use CassandraPlayground.Schema
  import Ecto.Changeset
  alias CassandraPlayground.Cassandra.Playground

  @primary_key false

  schema "playground" do
    field :id, Ecto.UUID, [autogenerate: true, primary_key: true]
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Playground{} = playground, attrs) do
    playground
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
