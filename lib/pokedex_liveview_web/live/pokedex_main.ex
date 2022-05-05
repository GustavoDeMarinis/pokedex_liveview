defmodule PokedexLiveviewWeb.PokedexMain do
  use Phoenix.LiveView
  alias PokedexLiveviewWeb.Router.Helpers, as: Routes
  import PokedexLiveview, only: [get_pokedex: 1, pokedex_url: 1]

  def mount(_params, _session, socket) do
    socket = assign(socket, :loading, true)

    {:ok, socket}
  end

  def handle_params(_params, _session, socket) do
    response = get_pokedex(pokedex_url("pokemon/?offset=0&limit=12"))
    IO.inspect("handle_params")

    socket = assign(socket, response)
    {:noreply, socket}
  end

  def handle_info(:load_end, socket) do
    IO.inspect("handle_info")
    {:noreply, assign(socket, :loading, false)}
  end

  def render(assigns) do
    send(self(), :load_end)
    IO.inspect("render")

    ~H"""
    <div>

      <.live_component module={PokedexSearchBar} id={"pokemon-search"}/>
      <%= if @loading == true do %>
        loading.....
      <%else %>
      <div class="flex flex-wrap bg-white items-center justify-center">

        <%= for %{id: id, img: img, name: name, types: types} = _pokemon <- @pokemon_list do %>
          <.live_component module={PokedexCard} id={id}  name={name} img={img} types={types}  />
        <%end %>
      </div>
      <button phx-click="previous">Prev</button>
      <button phx-click="next">Next</button>
      <%end%>
    </div>
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

  def handle_event("save", %{"pokemon" => %{"pokemon" => pokemon}}, socket) do
    {:noreply,
     push_redirect(socket,
       to: Routes.live_path(socket, PokedexLiveviewWeb.PokemonDetail, id: pokemon)
     )}
  end
end
