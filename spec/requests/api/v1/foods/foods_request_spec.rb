require 'rails_helper'

describe 'Foods API' do
  context 'foods exist in the database' do
    it 'sends a list of foods' do
      foods = create_list(:food, 5)

      get '/api/v1/foods'

      expect(response).to have_http_status(200)

      returned = JSON.parse(response.body)

      expect(returned.length).to eq(5)
      expect(returned).to_not include('created_at')
    end
  end

  context 'no foods exist in the database' do
    it 'sends a 404 response' do
      get '/api/v1/foods'

      expect(response).to have_http_status(404)
    end
  end

  context 'specific food exists in the database' do
    it 'send a single food with requested id' do
      foods = create_list(:food, 5)

      get "/api/v1/foods/#{foods[2].id}"

      expect(response).to have_http_status(200)

      returned = JSON.parse(response.body)

      expect(returned.length).to eq(3)
      expect(returned['id']).to eq(foods[2].id)
      expect(returned['name']).to eq(foods[2].name)
      expect(returned['calories']).to eq(foods[2].calories)
      expect(returned).to_not include('created_at')
    end
  end
end
