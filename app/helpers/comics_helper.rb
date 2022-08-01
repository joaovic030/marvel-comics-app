module ComicsHelper
  def user_favourite_comic(comic_id)
    current_user && current_user&.favourite_comics&.pluck(:comic_id)&.include?(comic_id)
  end
end
