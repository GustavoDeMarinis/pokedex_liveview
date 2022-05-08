defmodule PokedexLiveviewWeb.PokedexMain do
  use Phoenix.LiveView

  import PokedexLiveview,
    only: [
      get_pokedex: 1,
      pokedex_url: 1,
      get_pokemon_detail: 1,
      get_next_pokemon: 1,
      get_prev_pokemon: 1
    ]

  def mount(_params, _session, socket) do
    send(self(), %{load_data: pokedex_url("pokemon/?offset=0&limit=12")})

    {:ok, assign(socket, :loading, true)}
  end

  def handle_info(%{load_data: url}, socket) do
    response = get_pokedex(url)
    socket = assign(socket, response)
    {:noreply, assign(socket, :loading, false)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <div class="w-[1000px] mx-auto rounded-b-lg bg-[#c73929] px-10">
        <div class="mb-5">
          <.live_component module={PokedexSearchBar} id={"pokemon-search"}/>
          <div class="flex justify-between mt-2 py-5">
            <button phx-click="gen-search" class="rounded-lg text-stone-100 bg-stone-800 px-4" phx-value-id={"0"}>GEN I</button>
            <button phx-click="gen-search" class="rounded-lg text-stone-100 bg-stone-800 px-4" phx-value-id={"151"}>GEN II</button>
            <button phx-click="gen-search" class="rounded-lg text-stone-100 bg-stone-800 px-4" phx-value-id={"251"}>GEN III</button>
            <button phx-click="gen-search" class="rounded-lg text-stone-100 bg-stone-800 px-4" phx-value-id={"386"}>GEN IV</button>
            <button phx-click="gen-search" class="rounded-lg text-stone-100 bg-stone-800 px-4" phx-value-id={"494"}>GEN V</button>
            <button phx-click="gen-search" class="rounded-lg text-stone-100 bg-stone-800 px-4" phx-value-id={"649"}>GEN VI</button>
            <button phx-click="gen-search" class="rounded-lg text-stone-100 bg-stone-800 px-4" phx-value-id={"721"}>GEN VII</button>
            <button phx-click="gen-search" class="rounded-lg text-stone-100 bg-stone-800 px-4" phx-value-id={"809"}>GEN VIII</button>
          </div>
        </div>
      </div>
        <%= if @loading == true do %>
        <div class="flex justify-center h-[1000px] rounded-lg">
          <img class=" w-[1000px] object-cover overflow-hidden" src="https://cdn.dribbble.com/users/621155/screenshots/2835314/media/b8b82bbaa27a34d60c0ce475092828bd.gif">
        </div>
        <%else %>
        <div class="mx-auto w-[1000px] h-[1022px] bg-stone-100 rounded-lg flex-column">
          <div class="flex flex-wrap justify-evenly ">
            <%= if @pokemon_detail != nil do %>
              <.live_component module={PokedexDetail} id={"pokemon-detail"} pokemon_detail={@pokemon_detail} prev_pokemon={@prev_pokemon} next_pokemon={@next_pokemon}/>
            <% else %>
              <%= for %{id: id, img: img, name: name, types: types} = _pokemon <- @pokemon_list do %>
                <.live_component module={PokedexCard} id={id}  name={name} img={img} types={types}  />
              <%end %>
            <% end %>
          </div>
          <%= if @pokemon_detail == nil do %>
            <div class="flex justify-between w-[1000px] mx-auto mt-[1.3rem] items-stretch self-end">
              <button phx-click="previous" disabled={!@previous_url} class="bg-[#c73929] text-white text-[23px] relative w-[284px] h-[63px] rounded-tr-lg rounded-bl-lg flex  justify-center items-center group disabled:bg-stone-200">
                <img class="w-[29px] absolute left-[12%] group-hover:left-[10%] transition-all"  src="data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHZpZXdCb3g9IjAgMCAxNzIgMTcyIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9Im5vbnplcm8iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2UtbGluZWNhcD0iYnV0dCIgc3Ryb2tlLWxpbmVqb2luPSJtaXRlciIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtZGFzaGFycmF5PSIiIHN0cm9rZS1kYXNob2Zmc2V0PSIwIiBmb250LWZhbWlseT0ibm9uZSIgZm9udC13ZWlnaHQ9Im5vbmUiIGZvbnQtc2l6ZT0ibm9uZSIgdGV4dC1hbmNob3I9Im5vbmUiIHN0eWxlPSJtaXgtYmxlbmQtbW9kZTogbm9ybWFsIj48cGF0aCBkPSJNMCwxNzJ2LTE3MmgxNzJ2MTcyeiIgZmlsbD0ibm9uZSI+PC9wYXRoPjxnIGZpbGw9IiNmZmZmZmYiPjxwYXRoIGQ9Ik0xMjAuMjY1NjMsMTAuMjUyODFjLTEuNzg3MTksMC4wNTM3NSAtMy40ODAzMSwwLjgwNjI1IC00LjczLDIuMDgyODFsLTY4LjgsNjguOGMtMi42ODc1LDIuNjg3NSAtMi42ODc1LDcuMDQxMjUgMCw5LjcyODc1bDY4LjgsNjguOGMxLjcyLDEuODAwNjIgNC4yODY1NiwyLjUyNjI1IDYuNzA1MzEsMS44OTQ2OWMyLjQwNTMxLC0wLjYzMTU2IDQuMjg2NTYsLTIuNTEyODEgNC45MTgxMywtNC45MTgxM2MwLjYzMTU2LC0yLjQxODc1IC0wLjA5NDA2LC00Ljk4NTMxIC0xLjg5NDY5LC02LjcwNTMxbC02My45MzU2MywtNjMuOTM1NjNsNjMuOTM1NjMsLTYzLjkzNTYyYzIuMDI5MDYsLTEuOTc1MzEgMi42NDcxOSwtNC45OTg3NSAxLjU0NTMxLC03LjYxOTA2Yy0xLjExNTMxLC0yLjYwNjg4IC0zLjcwODc1LC00LjI3MzEzIC02LjU0NDA2LC00LjE5MjV6Ij48L3BhdGg+PC9nPjwvZz48L3N2Zz4=">
                <spam>Prev</spam>
              </button>
              <button phx-click="next" disabled={!@next_url}  class="bg-[#c73929] text-white text-[23px] relative w-[284px] h-[63px] group rounded-tl-lg rounded-br-lg flex justify-center items-center disabled:bg-stone-200">
                <spam>Next</spam>
                <img  class="w-[29px] absolute right-[12%] group-hover:right-[10%] transition-all" src="data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHZpZXdCb3g9IjAgMCAxNzIgMTcyIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9Im5vbnplcm8iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2UtbGluZWNhcD0iYnV0dCIgc3Ryb2tlLWxpbmVqb2luPSJtaXRlciIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtZGFzaGFycmF5PSIiIHN0cm9rZS1kYXNob2Zmc2V0PSIwIiBmb250LWZhbWlseT0ibm9uZSIgZm9udC13ZWlnaHQ9Im5vbmUiIGZvbnQtc2l6ZT0ibm9uZSIgdGV4dC1hbmNob3I9Im5vbmUiIHN0eWxlPSJtaXgtYmxlbmQtbW9kZTogbm9ybWFsIj48cGF0aCBkPSJNMCwxNzJ2LTE3MmgxNzJ2MTcyeiIgZmlsbD0ibm9uZSI+PC9wYXRoPjxnIGZpbGw9IiNmZmZmZmYiPjxwYXRoIGQ9Ik01MS41MzI4MSwxMC4yNTI4MWMtMi44MDg0NCwwIC01LjMyMTI1LDEuNzA2NTYgLTYuMzY5MzgsNC4zYy0xLjA2MTU2LDIuNTkzNDQgLTAuNDMsNS41NjMxMiAxLjU3MjE5LDcuNTExNTZsNjMuOTM1NjIsNjMuOTM1NjJsLTYzLjkzNTYyLDYzLjkzNTYzYy0xLjgwMDYzLDEuNzIgLTIuNTI2MjUsNC4yODY1NiAtMS44OTQ2OSw2LjcwNTMxYzAuNjMxNTYsMi40MDUzMSAyLjUxMjgxLDQuMjg2NTYgNC45MTgxMyw0LjkxODEzYzIuNDE4NzUsMC42MzE1NiA0Ljk4NTMxLC0wLjA5NDA2IDYuNzA1MzEsLTEuODk0NjlsNjguOCwtNjguOGMyLjY4NzUsLTIuNjg3NSAyLjY4NzUsLTcuMDQxMjUgMCwtOS43Mjg3NWwtNjguOCwtNjguOGMtMS4zMDM0NCwtMS4zMzAzMSAtMy4wNzcxOSwtMi4wODI4MSAtNC45MzE1NiwtMi4wODI4MXoiPjwvcGF0aD48L2c+PC9nPjwvc3ZnPg==">
              </button>
            </div>
          <%end%>
        </div>

        <%end%>


    </div>
    """
  end

  def handle_event("gen-search", %{"id" => id} = _params, socket) do
    send(self(), %{load_data: pokedex_url("pokemon?offset=" <> id <> "&limit=12")})
    {:noreply, assign(socket, :loading, true)}
  end

  def handle_event("detail", %{"id" => id} = _params, socket) do
    response = get_pokemon_detail(pokedex_url("pokemon/" <> id))
    int_id = String.to_integer(id)
    next_pokemon = get_next_pokemon(int_id)
    prev_pokemon = get_prev_pokemon(int_id)

    socket =
      socket
      |> assign(:pokemon_detail, response)
      |> assign(:next_pokemon, next_pokemon)
      |> assign(:prev_pokemon, prev_pokemon)

    {:noreply, socket}
  end

  def handle_event("previous", _, socket) do
    %{previous_url: previous_url} = socket.assigns

    case previous_url do
      nil ->
        nil

      _ ->
        send(self(), %{load_data: previous_url})
        {:noreply, assign(socket, :loading, true)}
    end
  end

  def handle_event("next", _, socket) do
    %{next_url: next_url} = socket.assigns

    case next_url do
      nil ->
        nil

      _ ->
        send(self(), %{load_data: next_url})
        {:noreply, assign(socket, :loading, true)}
    end
  end

  def handle_event("save", %{"pokemon" => %{"pokemon" => pokemon}}, socket) do
    response = get_pokemon_detail(pokedex_url("pokemon/" <> pokemon))

    next_pokemon =
      if response == %{error: :not_found} do
        nil
      else
        get_next_pokemon(response.id)
      end

    prev_pokemon =
      if response == %{error: :not_found} do
        nil
      else
        get_prev_pokemon(response.id)
      end

    socket =
      socket
      |> assign(:pokemon_detail, response)
      |> assign(:next_pokemon, next_pokemon)
      |> assign(:prev_pokemon, prev_pokemon)

    {:noreply, socket}
  end

  def handle_event("back_to_pokedex", _, socket) do
    {:noreply, assign(socket, :pokemon_detail, nil)}
  end
end
