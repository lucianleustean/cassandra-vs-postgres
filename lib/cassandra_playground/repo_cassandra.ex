defmodule CassandraPlayground.RepoCassandra do
  use Ecto.Repo,
    otp_app: :cassandra_playground,
    adapter: Cassandra.Ecto
end
