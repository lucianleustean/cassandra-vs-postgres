defmodule CassandraPlayground.RepoCassandra.Migrations.CreateCassandraPlayground do
  use Cassandra.Ecto.Migration

  def change do
    create table(:playground, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string

      add :inserted_at, :utc_datetime
      add :updated_at, :utc_datetime
    end
  end
end
