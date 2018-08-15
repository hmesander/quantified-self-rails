require 'rails_helper'

describe 'Foods API' do
  context 'User requests to associate a food with a meal and both exist' do
    it 'send a message and 201 response' do
      food = create(:food)
      breakfast = Meal.create!(name: 'Breakfast')

      post "/api/v1/meals/#{breakfast.id}/foods/#{food.id}"

      expect(response).to have_http_status(201)
      expect(response.message).to eq("Successfully added #{food.name} to #{breakfast.name}")
    end
  end
end
