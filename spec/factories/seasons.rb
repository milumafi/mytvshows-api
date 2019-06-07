FactoryBot.define do
  factory :season do
    title { Faker::Lorem.word }
    plot { Faker::Lorem.word }
  end
end