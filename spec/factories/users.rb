FactoryBot.define do
  factory :user do
    email    { Faker::Internet.unique.email }
    password { Faker::Internet.password }
  end

  trait :with_favourite_comics do
    after(:create) do |user, evaluator|
      create(:favourite_comic, user: user)
    end
  end
end
