FactoryBot.define do
  factory :movie do
    title { Faker::Lorem.word }
    plot { Faker::Lorem.word }
  end
end