defmodule PokedexLiveview do
  def get_pokedex(url) do
    res = HTTPoison.get(url)
    {:ok, %HTTPoison.Response{body: body}} = res
    %{"results" => results, "next" => next_url, "previous" => previous_url} = Poison.decode!(body)

    pokemon_list =
      Enum.map(results, fn %{"url" => url} = _result ->
        get_pokemon_detail(url)
      end)

    %{
      pokemon_list: pokemon_list,
      next_url: next_url,
      previous_url: previous_url,
      pokemon_detail_url: url
    }
  end

  def get_pokemon_detail(url) do
    res = HTTPoison.get(url)
    {:ok, %HTTPoison.Response{body: body}} = res

    case body do
      "Not Found" ->
        %{error: :not_found}

      _ ->
        pokemon = Poison.decode!(body)

        %{
          "name" => name,
          "id" => id,
          "sprites" => %{"other" => %{"official-artwork" => %{"front_default" => img}}},
          "types" => types,
          "abilities" => abilities,
          "height" => height,
          "weight" => weight,
          "stats" => stats
        } = pokemon

        %{
          name: name,
          id: id,
          img: img,
          types: types,
          abilities: abilities,
          height: height,
          weight: weight,
          stats: stats,
          error: nil
        }
    end
  end

  def pokedex_url(endpoint) do
    "https://pokeapi.co/api/v2/" <> endpoint
  end
end
