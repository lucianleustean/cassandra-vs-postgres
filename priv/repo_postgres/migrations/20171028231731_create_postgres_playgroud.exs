defmodule CassandraPlayground.RepoPostgres.Migrations.CreatePostgresPlaygroud do
  use Ecto.Migration

  def change do
    create table(:playgroud, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string

      timestamps()
    end

  end
end
