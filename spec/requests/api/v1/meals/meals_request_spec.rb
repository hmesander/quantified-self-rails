require 'rails_helper'

describe 'Meals API' do
  context 'User requests all meals' do
    it 'sends a list of meals and associated foods' do
      breakfast = Meal.create!(name: 'Breakfast')
      food1 = breakfast.foods.create!(name: 'Banana', calories: 150)
      food2 = breakfast.foods.create!(name: 'Yogurt', calories: 550)
      food3 = breakfast.foods.create!(name: 'Apple', calories: 220)

      snack = Meal.create!(name: 'Snack')
      food4 = snack.foods.create!(name: 'Gum', calories: 40)
      food5 = snack.foods.create!(name: 'Cheese', calories: 400)

      lunch = Meal.create!(name: 'Lunch')
      food6 = lunch.foods.create!(name: 'Burger', calories: 650)

      dinner= Meal.create!(name: 'Dinner')
      food7 = dinner.foods.create!(name: 'Steak', calories: 1650)

      get '/api/v1/meals'

      expect(response).to have_http_status(200)

      expected = [
        {
          id: breakfast.id,
          name: breakfast.name,
          foods: [food1, food2, food3]
        },
        {
          id: snack.id,
          name: snack.name,
          foods: [food4, food5]
        },
        {
          id: lunch.id,
          name: lunch.name,
          foods: [food6]
        },
        {
          id: dinner.id,
          name: dinner.name,
          foods: [food7]
        }
      ]

      returned = JSON.parse(response.body)

      expect(returned.length).to eq(4)
      expect(response.body).to eq(expected.to_json)
      expect(returned).to_not include('created_at')
    end
  end
end
