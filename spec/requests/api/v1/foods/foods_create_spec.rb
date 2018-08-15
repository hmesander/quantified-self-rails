require 'rails_helper'

describe 'Foods API' do
  context 'User creates a food with valid passed parameters' do
    it 'successfully creates food and returns the new food information' do
      headers = { 'ACCEPT' => 'application/json' }
      body = { 'food': { 'name': 'Banana', 'calories': 80 } }

      post '/api/v1/foods', headers: headers, params: body

      returned = JSON.parse(response.body, symbolize_names: true)
      expected = Food.last

      expect(response).to have_http_status(200)
      expect(returned[:id]).to eq(expected.id)
      expect(returned[:name]).to eq(expected.name)
      expect(returned[:calories]).to eq(expected.calories)
    end
  end
end
