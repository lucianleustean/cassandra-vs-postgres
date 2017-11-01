ExUnit.start exclude: [:uses_usec, :id_type, :read_after_writes, :sql_fragments, :decimal_type, :invalid_prefix, :transaction, :foreign_key_constraint]

Ecto.Adapters.SQL.Sandbox.mode(CassandraPlayground.RepoPostgres, :manual)

_ = Cassandra.Ecto.storage_down(CassandraPlayground.RepoCassandra.config)
:ok = Cassandra.Ecto.storage_up(CassandraPlayground.RepoCassandra.config)

Ecto.Migrator.run(CassandraPlayground.RepoCassandra, "priv/repo_cassandra/migrations", :up, [log: :false, all: true])
