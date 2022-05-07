defmodule PokedexCard do
  use PokedexLiveviewWeb, :live_component
  import PokedexLiveview, only: [get_type_color: 1]

  def render(assigns) do
    ~H"""
    <div class="w-[205.17px] mt-10 hover:-translate-y-1 transition-all cursor-pointer" phx-click="detail" phx-value-id={Integer.to_string(@id)}>

        <div class="rounded-lg overflow-hidden">
          <img class="bg-stone-200" src={@img} >
        </div>
          <p class="text-stone-400">N.º: <%= String.pad_leading(to_string(@id), 3, "0") %></p>
          <p class="text-stone-800 text-[23px] leading-5"><%= String.capitalize(@name) %></p>
          <div class="flex mt-1">
            <%= for %{"type" => %{"name" => type_name}} = _type <- @types do %>
              <div class="px-4 flex content-center py-px rounded mr-1" style={get_type_color(type_name)}><p class="text-[12px]"><%= type_name %></p></div>
            <%end %>
          </div>


    </div>
    """
  end
end

# <%= live_patch to: Routes.live_path(@socket, PokedexLiveviewWeb.PokemonDetail, id: @id), replace: false do %>
# <%end %>
