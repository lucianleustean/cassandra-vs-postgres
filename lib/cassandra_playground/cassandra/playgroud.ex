defmodule CassandraPlayground.Cassandra.Playgroud do
  use CassandraPlayground.Schema
  import Ecto.Changeset
  alias CassandraPlayground.Cassandra.Playgroud

  @primary_key false

  schema "playgroud" do
    field :id, Ecto.UUID, [autogenerate: true, primary_key: true]
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Playgroud{} = playgroud, attrs) do
    playgroud
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
