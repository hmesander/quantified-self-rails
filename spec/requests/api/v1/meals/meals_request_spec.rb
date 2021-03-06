require 'rails_helper'

describe 'Meals API' do
  before :each do
    @breakfast = Meal.create!(name: 'Breakfast')
    @food1 = @breakfast.foods.create!(name: 'Banana', calories: 150)

    @snack = Meal.create!(name: 'Snack')
    @food2 = @snack.foods.create!(name: 'Gum', calories: 400)
  end

  context 'User requests all meals' do
    it 'sends a list of meals and associated foods' do
      get '/api/v1/meals'

      expect(response).to have_http_status(200)

      expected = [
        {
          id: @breakfast.id,
          name: @breakfast.name,
          foods: [id: @food1.id, name: @food1.name, calories: @food1.calories]
        },
        {
          id: @snack.id,
          name: @snack.name,
          foods: [id: @food2.id, name: @food2.name, calories: @food2.calories]
        }
      ]

      returned = JSON.parse(response.body)

      expect(returned.length).to eq(2)
      expect(response.body).to eq(expected.to_json)
      expect(returned).to_not include('created_at')
    end
  end

  context 'User requests a single meal' do
    it 'sends a single meal and its associated foods' do
      get "/api/v1/meals/#{@breakfast.id}/foods"

      expect(response).to have_http_status(200)

      expected =
        {
          id: @breakfast.id,
          name: @breakfast.name,
          foods: [id: @food1.id, name: @food1.name, calories: @food1.calories]
        }

      returned = JSON.parse(response.body)

      expect(returned.length).to eq(3)
      expect(response.body).to eq(expected.to_json)
      expect(returned).to_not include(@snack.id)
    end
  end

  context 'User requests a single meal that does not exist' do
    it 'returns 404 status' do
      get '/api/v1/meals/3/foods'

      expect(response).to have_http_status(404)
    end
  end
end
