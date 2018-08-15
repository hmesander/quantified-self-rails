require 'rails_helper'

describe 'Meal Foods API' do
  context 'User requests to disassociate a food with a meal and both exist' do
    it 'send a message and 204 response' do
      food = create(:food)
      breakfast = Meal.create!(name: 'Breakfast')
      MealFood.create!(food: food, meal: breakfast)

      delete "/api/v1/meals/#{breakfast.id}/foods/#{food.id}"

      returned = JSON.parse(response.body)

      expect(response).to have_http_status(204)
      expect(returned['message']).to eq("Successfully removed #{food.name} from #{breakfast.name}")
    end
  end
end
