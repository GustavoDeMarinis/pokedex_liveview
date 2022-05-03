defmodule PokedexLiveview do
  def get_pokedex do
    res = HTTPoison.get(pokedex_url("pokemon/"))
    {:ok, %HTTPoison.Response{body: body}} = res

    %{"results" => results} = Poison.decode!(body)

    pokemonList =
      Enum.map(results, fn %{"url" => url} = _result ->
        get_pokemon_preview(url)
      end)

    pokemonList
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

    IO.inspect({name, id, img, types})
  end

  def pokedex_url(endpoint) do
    "https://pokeapi.co/api/v2/" <> endpoint
  end
end
