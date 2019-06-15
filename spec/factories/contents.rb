FactoryBot.define do
  factory :content do
    content_type { Faker::Lorem.word }
    content_id { Faker::Number.number(10).to_i }
    video_quality { Faker::Lorem.word }
    price { Faker::Number.number(10).to_f }
    user_id nil
  end
end