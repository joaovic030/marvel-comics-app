FactoryBot.define do
  factory :favourite_comic do
    user
    comic_id { Faker::Number.positive.to_i }
  end
end
