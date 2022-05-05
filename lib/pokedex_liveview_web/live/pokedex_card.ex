defmodule PokedexCard do
  use PokedexLiveviewWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
      <%= live_patch to: Routes.live_path(@socket, PokedexLiveviewWeb.PokemonDetail, id: @id), replace: false do %>
        <div>
        <img class="bg-stone-200" src={@img} >
        <p>N.º: <%= String.pad_leading(to_string(@id), 3, "0") %></p>
        <p><%= String.capitalize(@name) %></p>

        <%= for %{"type" => %{"name" => type_name}} = _type <- @types do %>
          <p><%= type_name %></p>
        <%end %>
        </div>
      <%end %>
    </div>
    """
  end
end
