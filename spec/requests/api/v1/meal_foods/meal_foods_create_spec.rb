require 'rails_helper'

describe 'Meal Foods API' do
  context 'User requests to associate a food with a meal and both exist' do
    it 'send a message and 201 response' do
      food = create(:food)
      breakfast = Meal.create!(name: 'Breakfast')

      post "/api/v1/meals/#{breakfast.id}/foods/#{food.id}"

      returned = JSON.parse(response.body)

      expect(response).to have_http_status(201)
      expect(returned['message']).to eq("Successfully added #{food.name} to #{breakfast.name}")
    end
  end

  context 'User requests to associate a food with a meal and food does not exist' do
    it 'send a message and 201 response' do
      breakfast = Meal.create!(name: 'Breakfast')

      post "/api/v1/meals/#{breakfast.id}/foods/1"

      expect(response).to have_http_status(404)
    end
  end

  context 'User requests to associate a food with a meal and meal does not exist' do
    it 'send a message and 201 response' do
      food = create(:food)

      post "/api/v1/meals/1/foods/#{food.id}"

      expect(response).to have_http_status(404)
    end
  end
end
