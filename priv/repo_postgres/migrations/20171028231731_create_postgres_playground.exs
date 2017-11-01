defmodule CassandraPlayground.RepoPostgres.Migrations.CreatePostgresPlayground do
  use Ecto.Migration

  def change do
    create table(:playground, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string

      timestamps()
    end

  end
end
