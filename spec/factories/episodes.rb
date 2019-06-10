FactoryBot.define do
  factory :episode do
    title { Faker::Lorem.word }
    plot { Faker::Lorem.word }
    episode_num { Faker::Number.number}
    season_id { nil }
  end
end