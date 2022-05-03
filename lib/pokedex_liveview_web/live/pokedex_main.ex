defmodule PokedexLiveviewWeb.PokedexMain do
  use Phoenix.LiveView
  import PokedexLiveview, only: [get_pokedex: 1, pokedex_url: 1]

  def mount(_params, _session, socket) do
    response = get_pokedex(pokedex_url("pokemon/"))
    socket = assign(socket, response)

    {:ok, socket}
  end

  def render(%{pokemon_list: pokemon_list} = assigns) do
    ~H"""
    <%= for %{id: id, img: img, name: name, types: types} = _pokemon <- pokemon_list do %>
      <%= live_component  PokedexCard, id: id,  name: name, img: img, types: types  %>
    <%end %>
    <button phx-click="previous">Prev</button>
    <button phx-click="next">Next</button>
    """
  end

  def handle_event("previous", _, socket) do
    %{previous_url: previous_url} = socket.assigns

    case previous_url do
      nil ->
        nil

      _ ->
        response = get_pokedex(previous_url)

        socket =
          socket
          |> assign(response)

        {:noreply, socket}
    end
  end

  def handle_event("next", _, socket) do
    %{next_url: next_url} = socket.assigns

    case next_url do
      nil ->
        nil

      _ ->
        response = get_pokedex(next_url)

        socket =
          socket
          |> assign(response)

        {:noreply, socket}
    end
  end
end
