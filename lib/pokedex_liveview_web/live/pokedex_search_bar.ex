defmodule PokedexSearchBar do
  use PokedexLiveviewWeb, :live_component

  def render(assigns) do
    ~H"""
      <div class="pt-5">
      <nav>

      <.form
        let={f}
        for={:pokemon}
        phx-submit="save"
        class="flex justify-between items-center"
        >

        <span class="text-white text-[19px]">Search by Pokemon name or Pokemon ID</span>
        <div class="flex items-center">
          <%= text_input f, :pokemon, autocomplete: "off" , class: "rounded-lg w-[500px] h-[37px] mr-2"%>
          <%= submit do %>
        <div class="p-1 rounded-lg bg-babyblue">
          <img class="w-[28px] h-[28px]" src="data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHZpZXdCb3g9IjAgMCAxNzIgMTcyIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9Im5vbnplcm8iIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2UtbGluZWNhcD0iYnV0dCIgc3Ryb2tlLWxpbmVqb2luPSJtaXRlciIgc3Ryb2tlLW1pdGVybGltaXQ9IjEwIiBzdHJva2UtZGFzaGFycmF5PSIiIHN0cm9rZS1kYXNob2Zmc2V0PSIwIiBmb250LWZhbWlseT0ibm9uZSIgZm9udC13ZWlnaHQ9Im5vbmUiIGZvbnQtc2l6ZT0ibm9uZSIgdGV4dC1hbmNob3I9Im5vbmUiIHN0eWxlPSJtaXgtYmxlbmQtbW9kZTogbm9ybWFsIj48cGF0aCBkPSJNMCwxNzJ2LTE3MmgxNzJ2MTcyeiIgZmlsbD0ibm9uZSI+PC9wYXRoPjxnIGZpbGw9IiNmZmZmZmYiPjxwYXRoIGQ9Ik03Mi4yNCwxMC4zMmMtMzIuMzMwNjIsMCAtNTguNDgsMjYuMTQ5MzggLTU4LjQ4LDU4LjQ4YzAsMzIuMzMwNjMgMjYuMTQ5MzgsNTguNDggNTguNDgsNTguNDhjMTEuNTQyODEsMCAyMi4yMjU2MywtMy4zODYyNSAzMS4yODI1LC05LjEzNzVsNDIuMjQ3NSw0Mi4yNDc1bDE0LjYyLC0xNC42MmwtNDEuNzEsLTQxLjYwMjVjNy40OTgxMywtOS44MzYyNSAxMi4wNCwtMjIuMDI0MDYgMTIuMDQsLTM1LjM2NzVjMCwtMzIuMzMwNjIgLTI2LjE0OTM3LC01OC40OCAtNTguNDgsLTU4LjQ4ek03Mi4yNCwyNC4wOGMyNC43NjUzMSwwIDQ0LjcyLDE5Ljk1NDY5IDQ0LjcyLDQ0LjcyYzAsMjQuNzY1MzEgLTE5Ljk1NDY5LDQ0LjcyIC00NC43Miw0NC43MmMtMjQuNzY1MzEsMCAtNDQuNzIsLTE5Ljk1NDY5IC00NC43MiwtNDQuNzJjMCwtMjQuNzY1MzEgMTkuOTU0NjksLTQ0LjcyIDQ0LjcyLC00NC43MnoiPjwvcGF0aD48L2c+PC9nPjwvc3ZnPg==" />
        </div>
        <% end %>
        </div>

      </.form>
      </nav>

    </div>
    """
  end
end
