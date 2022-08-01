class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favourite_comics

  validates :email, presence: true

  def favourite_comic(comic_id)
    favourite_comics.find_by(comic_id: comic_id)
  end
end
