defmodule BabbyPhoenix.BabbyController do
  use BabbyPhoenix.Web, :controller

  def index(conn, _params) do
    # render conn, "index.html"
    render conn, :index
  end

  def show(conn, %{"messenger" => messenger}) do
    render conn, :show, messenger: messenger
  end
end