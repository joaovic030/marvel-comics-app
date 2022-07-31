class CharactersController < ApplicationController
  include Marvel::ComicService

  def index
    characters_ids = fetch_characters({ nameStartsWith: params[:character_name] }).pluck(:id)

    render json: { ids: characters_ids }
  end
end
