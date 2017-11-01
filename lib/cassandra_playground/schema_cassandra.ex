defmodule CassandraPlayground.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      # TODO: issue to be fixed in Ecto. As a work around move usec to test env
      # https://github.com/phoenixframework/phoenix/issues/2152
      # @timestamps_opts [type: :utc_datetime]
      @timestamps_opts [type: :utc_datetime, usec: Mix.env != :test]
    end
  end
end
