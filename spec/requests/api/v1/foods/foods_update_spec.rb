require 'rails_helper'

describe 'Foods API' do
  context 'User updates food with valid parameters' do
    it 'sends the updated food information' do
      food = create(:food)

      headers = { 'ACCEPT' => 'application/json' }
      body = { 'food': { 'name': 'Banana', 'calories': 80 } }

      patch "/api/v1/foods/#{food.id}", headers: headers, params: body

      expect(response).to have_http_status(200)

      returned = JSON.parse(response.body)

      expect(returned.length).to eq(3)
      expect(returned['id']).to eq(food.id)
      expect(returned['name']).to eq('Banana')
      expect(returned['calories']).to eq(80)
    end
  end

  context 'User attempts to update food with invalid parameters' do
    it 'sends 400 response' do
      food = create(:food)

      headers = { 'ACCEPT' => 'application/json' }
      body = { 'food': { 'name': 'Banana' } }

      patch "/api/v1/foods/#{food.id}", headers: headers, params: body

      expect(response).to have_http_status(400)
    end
  end

  context 'User attempts to update food that does not exist' do
    it 'sends 404 response' do
      headers = { 'ACCEPT' => 'application/json' }
      body = { 'food': { 'name': 'Banana', 'calories': 80 } }

      patch '/api/v1/foods/1', headers: headers, params: body

      expect(response).to have_http_status(404)
    end
  end
end
