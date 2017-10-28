defmodule CassandraPlaygroundWeb.PageController do
  use CassandraPlaygroundWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
