require 'csv'

CSV.foreach('./db/data/foods.csv', headers: true, header_converters: :symbol) do |row|
  Food.create!(name: row[:display_name], calories: row[:calories].to_f.round)
end

Meal.create!(name: 'Breakfast')
Meal.create!(name: 'Snack')
Meal.create!(name: 'Lunch')
Meal.create!(name: 'Dinner')
