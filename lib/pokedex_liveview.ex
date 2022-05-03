defmodule PokedexLiveview do
  def get_pokedex(url) do
    res = HTTPoison.get(url)
    {:ok, %HTTPoison.Response{body: body}} = res

    %{"results" => results, "next" => next_url, "previous" => previous_url} = Poison.decode!(body)

    pokemon_list =
      Enum.map(results, fn %{"url" => url} = _result ->
        get_pokemon_preview(url)
      end)

    %{pokemon_list: pokemon_list, next_url: next_url, previous_url: previous_url}
  end

  def get_pokemon_preview(url) do
    res = HTTPoison.get(url)
    {:ok, %HTTPoison.Response{body: body}} = res

    pokemon = Poison.decode!(body)

    %{
      "name" => name,
      "id" => id,
      "sprites" => %{"other" => %{"official-artwork" => %{"front_default" => img}}},
      "types" => types
    } = pokemon

    %{name: name, id: id, img: img, types: types}
  end

  def pokedex_url(endpoint) do
    "https://pokeapi.co/api/v2/" <> endpoint
  end
end
