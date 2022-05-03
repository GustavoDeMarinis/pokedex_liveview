defmodule PokedexCard do
  use PokedexLiveviewWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
    <img src={@img} >
    <p><%= @id %></p>
    <p><%= @name %></p>

    <%= for %{"type" => %{"name" => type_name}} = _type <- @types do %>
      <p><%= type_name %></p>
    <%end %>
    </div>
    """
  end
end
