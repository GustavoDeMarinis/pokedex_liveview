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
      # pokemon_detail_url: url,
      pokemon_detail: nil
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

  def get_type_color(type) do
    case type do
      "poison" -> "background-color: #b97fc9"
      "grass" -> "background-color: #9bcc50"
      "fire" -> "background-color: #fd7d24"
      "water" -> "background-color: #4592c4"
      "flying" -> "background-color: #3dc7ef"
      "bug" -> "background-color: #729f3f"
      "normal" -> "background-color: #a4acaf"
      "electric" -> "background-color: #eed535"
      "ground" -> "background-color: #ab9842"
      "fairy" -> "background-color: #fdb9e9"
      "rock" -> "background-color: #a38c21"
      "dragon" -> "background-color: #53a4cf"
      "ghost" -> "background-color: #7b62a3"
      "psychic" -> "background-color: #f366b9"
      "steel" -> "background-color: #9eb7b8"
      "dark" -> "background-color: #707070"
      "fighting" -> "background-color: #d56723"
      "ice" -> "background-color: #51c4e7"
      _ -> ""
    end
  end

  def pokedex_url(endpoint) do
    "https://pokeapi.co/api/v2/" <> endpoint
  end
end
