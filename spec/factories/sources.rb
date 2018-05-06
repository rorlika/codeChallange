FactoryBot.define do
  factory :source do
    h1 { [Faker::Lorem.word] }
    h2 { [Faker::Lorem.word] }
    h3 { [Faker::Lorem.word] }
    links { [Faker::Lorem.word] }
  end
end
