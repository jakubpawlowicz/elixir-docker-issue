defmodule Dummy.PageController do
  use Dummy.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
