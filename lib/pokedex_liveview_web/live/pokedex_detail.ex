defmodule PokedexDetail do
  use PokedexLiveviewWeb, :live_component
  import PokedexLiveview, only: [get_type_color: 1]

  def render(assigns) do
    ~H"""
    <div class="p-4">
      <%= if @pokemon_detail.error == :not_found do %>
        <div class="h-[1000px] flex flex-col mt-[200px]">
          <img src="https://scontent.faep9-2.fna.fbcdn.net/v/t1.15752-9/277921997_2121354751357412_8697953158193217267_n.png?_nc_cat=111&ccb=1-6&_nc_sid=ae9488&_nc_eui2=AeHWIQVY1qhoIpykJdt4qyPr1KkMrZ4NUbHUqQytng1RsRgZBNFLZ0lNja4vWknil0U&_nc_ohc=Oqrtfjgl4yQAX_8B2fV&tn=8oVBUybs9O6pQVs_&_nc_ht=scontent.faep9-2.fna&oh=03_AVJYBnURhF4QcV-8s-yxZ7CIcXSVpA2PXpkR68zpTNU92w&oe=629B3E16" />
          <p class="text-[36px]">POKEMON NOT FOUND</p>
          <span class="text-center">Did you spell the name or id correctly?</span>
        </div>
      <% else %>

        <div class='flex justify-between my-4'>
          <button class="text-stone-300">
          <img class="w-[13px] absolute left-[12%] group-hover:left-[10%] transition-all"  src="data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHZpZXdCb3g9IjAgMCAxNzIgMTcyIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9Im5vbnplcm8iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2UtbGluZWNhcD0iYnV0dCIgc3Ryb2tlLWxpbmVqb2luPSJtaXRlciIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtZGFzaGFycmF5PSIiIHN0cm9rZS1kYXNob2Zmc2V0PSIwIiBmb250LWZhbWlseT0ibm9uZSIgZm9udC13ZWlnaHQ9Im5vbmUiIGZvbnQtc2l6ZT0ibm9uZSIgdGV4dC1hbmNob3I9Im5vbmUiIHN0eWxlPSJtaXgtYmxlbmQtbW9kZTogbm9ybWFsIj48cGF0aCBkPSJNMCwxNzJ2LTE3MmgxNzJ2MTcyeiIgZmlsbD0ibm9uZSI+PC9wYXRoPjxnIGZpbGw9IiNmZmZmZmYiPjxwYXRoIGQ9Ik0xMjAuMjY1NjMsMTAuMjUyODFjLTEuNzg3MTksMC4wNTM3NSAtMy40ODAzMSwwLjgwNjI1IC00LjczLDIuMDgyODFsLTY4LjgsNjguOGMtMi42ODc1LDIuNjg3NSAtMi42ODc1LDcuMDQxMjUgMCw5LjcyODc1bDY4LjgsNjguOGMxLjcyLDEuODAwNjIgNC4yODY1NiwyLjUyNjI1IDYuNzA1MzEsMS44OTQ2OWMyLjQwNTMxLC0wLjYzMTU2IDQuMjg2NTYsLTIuNTEyODEgNC45MTgxMywtNC45MTgxM2MwLjYzMTU2LC0yLjQxODc1IC0wLjA5NDA2LC00Ljk4NTMxIC0xLjg5NDY5LC02LjcwNTMxbC02My45MzU2MywtNjMuOTM1NjNsNjMuOTM1NjMsLTYzLjkzNTYyYzIuMDI5MDYsLTEuOTc1MzEgMi42NDcxOSwtNC45OTg3NSAxLjU0NTMxLC03LjYxOTA2Yy0xLjExNTMxLC0yLjYwNjg4IC0zLjcwODc1LC00LjI3MzEzIC02LjU0NDA2LC00LjE5MjV6Ij48L3BhdGg+PC9nPjwvZz48L3N2Zz4=">
          N.º: 001 Bulbasaur
          </button>
          <div class="flex">
            <p class='text-[36px] mr-2 text-stone-800'><%= String.capitalize(@pokemon_detail.name) %></p>
            <p class='text-[36px] text-stone-400'>N.º: <%=  String.pad_leading(to_string(@pokemon_detail.id), 3, "0")  %></p>
          </div>
          <button>Venasaur N.º: 003
          <img class="w-[13px] absolute right-[12%] group-hover:right-[10%] transition-all" src="data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHZpZXdCb3g9IjAgMCAxNzIgMTcyIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9Im5vbnplcm8iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2UtbGluZWNhcD0iYnV0dCIgc3Ryb2tlLWxpbmVqb2luPSJtaXRlciIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtZGFzaGFycmF5PSIiIHN0cm9rZS1kYXNob2Zmc2V0PSIwIiBmb250LWZhbWlseT0ibm9uZSIgZm9udC13ZWlnaHQ9Im5vbmUiIGZvbnQtc2l6ZT0ibm9uZSIgdGV4dC1hbmNob3I9Im5vbmUiIHN0eWxlPSJtaXgtYmxlbmQtbW9kZTogbm9ybWFsIj48cGF0aCBkPSJNMCwxNzJ2LTE3MmgxNzJ2MTcyeiIgZmlsbD0ibm9uZSI+PC9wYXRoPjxnIGZpbGw9IiM2NjY2NjYiPjxwYXRoIGQ9Ik0xMjUuMjQ4MjUsODAuNDk4NjlsLTY4LjY3MzY5LC02OS42NTE5NGwtNy44NTgyNSw3LjMzMTVsNTkuODg1NTYsNjcuODIxNzVsLTU5Ljg4NTU2LDY3LjgxOTA2bDcuODU4MjUsNy4zMzQxOWw2OC42NzM2OSwtNjkuNjUxOTRsNS40MjMzOCwtNS41MDEzMXoiPjwvcGF0aD48L2c+PC9nPjwvc3ZnPg==" />

          </button>
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

# <div class="flex justify-between w-[1000px] mx-auto  items-stretch self-end mt-[-17px]">
# <button phx-click="previous" class="bg-[#c0392b] text-white text-[23px] relative w-[284px] h-[63px] rounded-tl-lg rounded-br-lg flex  justify-center items-center group disabled:bg-stone-200">
#   <img class="w-[29px] absolute left-[12%] group-hover:left-[10%] transition-all"  src="data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHZpZXdCb3g9IjAgMCAxNzIgMTcyIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9Im5vbnplcm8iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2UtbGluZWNhcD0iYnV0dCIgc3Ryb2tlLWxpbmVqb2luPSJtaXRlciIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtZGFzaGFycmF5PSIiIHN0cm9rZS1kYXNob2Zmc2V0PSIwIiBmb250LWZhbWlseT0ibm9uZSIgZm9udC13ZWlnaHQ9Im5vbmUiIGZvbnQtc2l6ZT0ibm9uZSIgdGV4dC1hbmNob3I9Im5vbmUiIHN0eWxlPSJtaXgtYmxlbmQtbW9kZTogbm9ybWFsIj48cGF0aCBkPSJNMCwxNzJ2LTE3MmgxNzJ2MTcyeiIgZmlsbD0ibm9uZSI+PC9wYXRoPjxnIGZpbGw9IiNmZmZmZmYiPjxwYXRoIGQ9Ik0xMjAuMjY1NjMsMTAuMjUyODFjLTEuNzg3MTksMC4wNTM3NSAtMy40ODAzMSwwLjgwNjI1IC00LjczLDIuMDgyODFsLTY4LjgsNjguOGMtMi42ODc1LDIuNjg3NSAtMi42ODc1LDcuMDQxMjUgMCw5LjcyODc1bDY4LjgsNjguOGMxLjcyLDEuODAwNjIgNC4yODY1NiwyLjUyNjI1IDYuNzA1MzEsMS44OTQ2OWMyLjQwNTMxLC0wLjYzMTU2IDQuMjg2NTYsLTIuNTEyODEgNC45MTgxMywtNC45MTgxM2MwLjYzMTU2LC0yLjQxODc1IC0wLjA5NDA2LC00Ljk4NTMxIC0xLjg5NDY5LC02LjcwNTMxbC02My45MzU2MywtNjMuOTM1NjNsNjMuOTM1NjMsLTYzLjkzNTYyYzIuMDI5MDYsLTEuOTc1MzEgMi42NDcxOSwtNC45OTg3NSAxLjU0NTMxLC03LjYxOTA2Yy0xLjExNTMxLC0yLjYwNjg4IC0zLjcwODc1LC00LjI3MzEzIC02LjU0NDA2LC00LjE5MjV6Ij48L3BhdGg+PC9nPjwvZz48L3N2Zz4=">
#   <spam>Prev</spam>
# </button>
# <button phx-click="next" class="bg-[#c0392b] text-white text-[23px] relative w-[284px] h-[63px] group rounded-tr-lg rounded-bl-lg flex justify-center items-center disabled:bg-stone-200">
#   <spam>Next</spam>
#   <img  class="w-[29px] absolute right-[12%] group-hover:right-[10%] transition-all" src="data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHZpZXdCb3g9IjAgMCAxNzIgMTcyIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9Im5vbnplcm8iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2UtbGluZWNhcD0iYnV0dCIgc3Ryb2tlLWxpbmVqb2luPSJtaXRlciIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtZGFzaGFycmF5PSIiIHN0cm9rZS1kYXNob2Zmc2V0PSIwIiBmb250LWZhbWlseT0ibm9uZSIgZm9udC13ZWlnaHQ9Im5vbmUiIGZvbnQtc2l6ZT0ibm9uZSIgdGV4dC1hbmNob3I9Im5vbmUiIHN0eWxlPSJtaXgtYmxlbmQtbW9kZTogbm9ybWFsIj48cGF0aCBkPSJNMCwxNzJ2LTE3MmgxNzJ2MTcyeiIgZmlsbD0ibm9uZSI+PC9wYXRoPjxnIGZpbGw9IiNmZmZmZmYiPjxwYXRoIGQ9Ik01MS41MzI4MSwxMC4yNTI4MWMtMi44MDg0NCwwIC01LjMyMTI1LDEuNzA2NTYgLTYuMzY5MzgsNC4zYy0xLjA2MTU2LDIuNTkzNDQgLTAuNDMsNS41NjMxMiAxLjU3MjE5LDcuNTExNTZsNjMuOTM1NjIsNjMuOTM1NjJsLTYzLjkzNTYyLDYzLjkzNTYzYy0xLjgwMDYzLDEuNzIgLTIuNTI2MjUsNC4yODY1NiAtMS44OTQ2OSw2LjcwNTMxYzAuNjMxNTYsMi40MDUzMSAyLjUxMjgxLDQuMjg2NTYgNC45MTgxMyw0LjkxODEzYzIuNDE4NzUsMC42MzE1NiA0Ljk4NTMxLC0wLjA5NDA2IDYuNzA1MzEsLTEuODk0NjlsNjguOCwtNjguOGMyLjY4NzUsLTIuNjg3NSAyLjY4NzUsLTcuMDQxMjUgMCwtOS43Mjg3NWwtNjguOCwtNjguOGMtMS4zMDM0NCwtMS4zMzAzMSAtMy4wNzcxOSwtMi4wODI4MSAtNC45MzE1NiwtMi4wODI4MXoiPjwvcGF0aD48L2c+PC9nPjwvc3ZnPg==">
# </button>
# </div>
