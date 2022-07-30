class ComicsController < ApplicationController
  def index
    @comics = Poro::Comic.all
  end

  def show; end
end
