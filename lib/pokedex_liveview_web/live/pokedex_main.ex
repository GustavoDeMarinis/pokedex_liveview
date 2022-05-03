defmodule PokedexLiveviewWeb.PokedexMain do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    response = PokedexLiveview.get_pokedex()
    socket = assign(socket, :pokedex, response)

    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Hola</h1>
    """
  end
end
