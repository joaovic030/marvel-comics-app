# frozen_string_literal: true

class ComicsController < ApplicationController
  include Marvel::ComicService

  def index
    if params[:query].present?
      characters_ids = fetch_characters({ nameStartsWith: params[:query] }).pluck(:id)
      @comics = Poro::Comic.all({ characters: characters_ids })
    else
      @comics = Poro::Comic.all
    end

    @comics        = [] unless @comics.is_a?(Array)
    @pagy, @comics = pagy_array(@comics)

    if turbo_frame_request?
      respond_to do |format|
        format.turbo_stream { render turbo_stream.replace(:comics, partial: 'comics', locals: { comics: @comics, pagy: @pagy }) }
        format.html
      end
    else
      render :index
    end
  end

  def show; end
end
