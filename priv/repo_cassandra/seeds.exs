# Script for populating the database. You can run it as:
#
#     mix run priv/repo_cassandra/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CassandraPlayground.RepoCassandra.insert!(%CassandraPlayground.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

CassandraPlayground.Cassandra.create_playground(%{
  name: "Awesome Playground"
})
