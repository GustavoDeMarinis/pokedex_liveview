defmodule PokedexDetail do
  use PokedexLiveviewWeb, :live_component
  import PokedexLiveview, only: [get_type_color: 1]

  def render(assigns) do
    ~H"""
    <div class="p-4">
      <%= if @pokemon_detail.error == :not_found do %>
        <div class="h-[1000px] flex flex-col items-center content-center align-center">
          <img src="https://dreamingwithneko.files.wordpress.com/2011/05/question.png" />
          <p class="text-[36px]">POKEMON NOT FOUND</p>
          <span>Did you spell the name or id correctly?</span>
        </div>
      <% else %>
        <div class='flex justify-center'>
          <p class='text-[36px] mr-2 text-stone-800'><%= String.capitalize(@pokemon_detail.name) %></p>
          <p class='text-[36px] text-stone-400'>N.º: <%=  String.pad_leading(to_string(@pokemon_detail.id), 3, "0")  %></p>
        </div>
        <div class='flex text-[20px]'>
          <div class="rounded-lg overflow-hidden mr-4">
            <img class="bg-stone-200" src={@pokemon_detail.img} >
          </div>
          <div class="flex flex-col justify-between">
            <div class="rounded-lg bg-babyblue flex flex-wrap justify-between h-min-[243px] w-[429px] p-[12px]">
            <div class="w-[100%]">Info</div>
              <div class="w-[50%] text-[17px]">
                <p class="text-white mb-[-3px]">Height</p>
                <span><%= @pokemon_detail.height / 10 %> m</span>
                <p class="text-white mb-[-3px]">Weight</p>
                <span><%= @pokemon_detail.weight /10 %> kg</span>
              </div>
              <div class="w-[50%] text-[17px]">
              <p class="text-white">Ability</p>
                <%= for %{"ability" => %{"name" => ability_name}} = _ability <- @pokemon_detail.abilities do %>
                  <button class="flex items-center mb-px group ">
                    <span><%= String.capitalize(ability_name) %></span>
                    <div class="h-[30px] ml-2 flex items-center">
                      <img class="w-4 h-4 group-hover:scale-115" src="data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHZpZXdCb3g9IjAgMCAxNzIgMTcyIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9Im5vbnplcm8iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2UtbGluZWNhcD0iYnV0dCIgc3Ryb2tlLWxpbmVqb2luPSJtaXRlciIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtZGFzaGFycmF5PSIiIHN0cm9rZS1kYXNob2Zmc2V0PSIwIiBmb250LWZhbWlseT0ibm9uZSIgZm9udC13ZWlnaHQ9Im5vbmUiIGZvbnQtc2l6ZT0ibm9uZSIgdGV4dC1hbmNob3I9Im5vbmUiIHN0eWxlPSJtaXgtYmxlbmQtbW9kZTogbm9ybWFsIj48cGF0aCBkPSJNMCwxNzJ2LTE3MmgxNzJ2MTcyeiIgZmlsbD0ibm9uZSI+PC9wYXRoPjxnIGZpbGw9IiNmZmZmZmYiPjxwYXRoIGQ9Ik04NiwxNC4zMzMzM2MtMzkuNTYsMCAtNzEuNjY2NjcsMzIuMTA2NjcgLTcxLjY2NjY3LDcxLjY2NjY3YzAsMzkuNTYgMzIuMTA2NjcsNzEuNjY2NjcgNzEuNjY2NjcsNzEuNjY2NjdjMzkuNTYsMCA3MS42NjY2NywtMzIuMTA2NjcgNzEuNjY2NjcsLTcxLjY2NjY3YzAsLTM5LjU2IC0zMi4xMDY2NywtNzEuNjY2NjcgLTcxLjY2NjY3LC03MS42NjY2N3pNOTMuMTY2NjcsMTM2LjE2NjY3aC0xNC4zMzMzM3YtMTQuMzMzMzNoMTQuMzMzMzN6TTEwOC4wMDE2Nyw4MC42MjVsLTYuNDUsNi41OTMzM2MtNS4xNiw1LjIzMTY3IC04LjM4NSw5LjUzMTY3IC04LjM4NSwyMC4yODE2N2gtMTQuMzMzMzN2LTMuNTgzMzNjMCwtNy44ODMzMyAzLjIyNSwtMTUuMDUgOC4zODUsLTIwLjI4MTY3bDguODg2NjcsLTkuMDNjMi42NTE2NywtMi41OCA0LjIyODMzLC02LjE2MzMzIDQuMjI4MzMsLTEwLjEwNWMwLC03Ljg4MzMzIC02LjQ1LC0xNC4zMzMzMyAtMTQuMzMzMzMsLTE0LjMzMzMzYy03Ljg4MzMzLDAgLTE0LjMzMzMzLDYuNDUgLTE0LjMzMzMzLDE0LjMzMzMzaC0xNC4zMzMzM2MwLC0xNS44MzgzMyAxMi44MjgzMywtMjguNjY2NjcgMjguNjY2NjcsLTI4LjY2NjY3YzE1LjgzODMzLDAgMjguNjY2NjcsMTIuODI4MzMgMjguNjY2NjcsMjguNjY2NjdjMCw2LjMwNjY3IC0yLjU4LDEyLjA0IC02LjY2NSwxNi4xMjV6Ij48L3BhdGg+PC9nPjwvZz48L3N2Zz4=">
                    </div>
                    </button>
                <%end %>
              </div>
            </div>
            <div class="mb-4">
              <p class="mb-2">Type</p>
              <%= for %{"type" => %{"name" => type_name}} = _type <- @pokemon_detail.types do %>
                <span class="px-8 py-2 rounded mr-1 text-[18px]" style={get_type_color(type_name)}><%= type_name %></span>
              <%end %>
            </div>
            <div class="flex flex-wrap bg-[#707070] rounded-lg w-[429px] p-[12px]">
              <div class="w-[100%]">Stats</div>
                <%= for %{ "base_stat" => base_stat, "stat" => %{"name" => stat_name}} = _stat <- @pokemon_detail.stats do %>
                <div class="w-[50%] text-[17px]">
                  <p class="text-white mb-[-3px]"><%= String.capitalize(stat_name) %></p> <%= base_stat %>
                  </div>
                <%end %>

            </div>
          </div>
        </div>
      <%end %>
      <button phx-click="back_to_pokedex">
      Back to Pokedex
      </button>
    </div>
    """
  end
end
