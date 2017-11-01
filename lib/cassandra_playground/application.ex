defmodule CassandraPlayground.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(CassandraPlayground.RepoPostgres, []),
      supervisor(CassandraPlayground.RepoCassandra, []),
      # Start the endpoint when the application starts
      supervisor(CassandraPlaygroundWeb.Endpoint, []),
      # Start your own worker by calling: CassandraPlayground.Worker.start_link(arg1, arg2, arg3)
      # worker(CassandraPlayground.Worker, [arg1, arg2, arg3]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CassandraPlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CassandraPlaygroundWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
