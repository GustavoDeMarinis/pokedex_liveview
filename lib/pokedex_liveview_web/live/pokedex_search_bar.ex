defmodule PokedexSearchBar do
  use PokedexLiveviewWeb, :live_component

  def render(assigns) do
    ~H"""
      <div>
      <nav>
      <.form
        let={f}
        for={:pokemon}
        phx-submit="save"
        >
        <%= text_input f, :pokemon, autocomplete: "off"  %>
        <%= submit "Pepe" %>
      </.form>
      </nav>
      <a href="https://phoenixframework.org/" class="phx-logo">
        Aca imagen de pokedex
      </a>
    </div>
    """
  end
end
