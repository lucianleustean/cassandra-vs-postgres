# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cassandra_playground,
  ecto_repos: [CassandraPlayground.Repo]

# Configures the endpoint
config :cassandra_playground, CassandraPlaygroundWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/TYRAth4i1J+AYTvQjCvEIgRChmKD12d+/JwIQ3eeyQXowtqV6MujeGCzz0A03jo",
  render_errors: [view: CassandraPlaygroundWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CassandraPlayground.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
