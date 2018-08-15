require 'rails_helper'

describe 'Meal Foods API' do
  context 'User requests to disassociate a food with a meal and both exist' do
    xit 'send a message and 204 response' do
      food = create(:food)
      breakfast = Meal.create!(name: 'Breakfast')
      MealFood.create!(food: food, meal: breakfast)

      delete "/api/v1/meals/#{breakfast.id}/foods/#{food.id}"

      returned = JSON.parse(response.body)

      expect(response).to have_http_status(204)
      expect(returned['message']).to eq("Successfully removed #{food.name} from #{breakfast.name}")
    end
  end

  context 'User requests to disassociate a food with a meal but food does not exist' do
    it 'returns a 404 response' do
      breakfast = Meal.create!(name: 'Breakfast')

      delete "/api/v1/meals/#{breakfast.id}/foods/1"

      expect(response).to have_http_status(404)
    end
  end

  context 'User requests to disassociate a food with a meal but meal does not exist' do
    it 'returns a 404 response' do
      food = create(:food)

      delete "/api/v1/meals/1/foods/#{food.id}"

      expect(response).to have_http_status(404)
    end
  end
end
