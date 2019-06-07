FactoryBot.define do
  factory :episode do
    title { Faker::Lorem.word }
    plot { Faker::Lorem.word }
    done false
    season_id nil
  end
end