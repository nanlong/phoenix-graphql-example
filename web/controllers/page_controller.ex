defmodule PhoenixGraqhQLExample.PageController do
  use PhoenixGraqhQLExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
