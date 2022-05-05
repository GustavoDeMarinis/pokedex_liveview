defmodule PokedexLiveviewWeb.PokemonDetail do
  use Phoenix.LiveView
  import PokedexLiveview, only: [get_pokemon_detail: 1, pokedex_url: 1]

  def mount(params, _session, socket) do
    %{"id" => id} = params
    response = get_pokemon_detail(pokedex_url("pokemon/" <> id))

    socket = assign(socket, response)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""

      <div>

        <%= if assigns.error == :not_found do %>

        <div>
          POKEMON NOT FOUND
        </div>
        <% else %>
          <img src={@img} >
          <p>N.º: <%= @id %></p>
          <p>Name: <%= String.capitalize(@name) %></p>
          <p>Height:<%= @height %></p>
          <p>Weight:<%= @weight %></p>
          <%= for %{"type" => %{"name" => type_name}} = _type <- @types do %>
            <p>Type:<%= type_name %></p>
          <%end %>
          <%= for %{"ability" => %{"name" => ability_name}} = _ability <- @abilities do %>
            <p>Ability:<%= ability_name %></p>
          <%end %>
          <%= for %{ "base_stat" => base_stat, "stat" => %{"name" => stat_name}} = _stat <- @stats do %>
            <p><%= stat_name %>: <%= base_stat %></p>
          <%end %>
        <%end %>
      </div>

    """
  end
end
