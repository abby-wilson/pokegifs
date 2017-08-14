class PokemonController < ApplicationController

def show
  res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
  body = JSON.parse(res.body)
  name  = body["name"]
  type = body["types"][0]["type"]["name"]
  id = body["id"]

  result = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=#{params[:name]}/")
  body = JSON.parse(result.body)
  gif_url = body["data"][0]["url"]

  render json: { "name": name, "type": type, "id": id, "gif": gif_url }


end

end
