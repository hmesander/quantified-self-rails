FactoryBot.define do
  factory :food do
    name Faker::Food.unique.dish
    calories Faker::Number.unique.number(3)
  end
end
