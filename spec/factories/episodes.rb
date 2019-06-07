FactoryBot.define do
  factory :episode do
    title { Faker::Lorem.word }
    plot { Faker::Lorem.word }
    season_id nil
  end
end