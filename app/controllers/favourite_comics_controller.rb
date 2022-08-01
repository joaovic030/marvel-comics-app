# frozen_string_literal: true

class FavouriteComicsController < ApplicationController
  include Marvel::ComicService

  before_action :authenticate_user!, only: :create
  before_action :set_favourite_comic, :set_comic, only: :destroy

  def create
    @favourite_comic = FavouriteComic.create(favourite_comics_params)
    set_comic

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def destroy
    @favourite_comic.destroy

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  private

  def set_comic
    @comic = find_comic(@favourite_comic.comic_id)&.first
  end

  def set_favourite_comic
    @favourite_comic = FavouriteComic.find(params[:id])
  end

  def favourite_comics_params
    params.permit(:user_id, :comic_id)
  end
end
