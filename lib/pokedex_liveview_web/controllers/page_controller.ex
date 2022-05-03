defmodule PokedexLiveviewWeb.PageController do
  use PokedexLiveviewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
