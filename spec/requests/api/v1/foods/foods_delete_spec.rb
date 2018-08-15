require 'rails_helper'

describe 'Foods API' do
  context 'User attempts to delete a food that exists in the database' do
    it 'successfully deletes food and returns 204 status' do
      foods = create_list(:food, 5)

      get '/api/v1/foods'
      returned = JSON.parse(response.body)
      expect(returned.length).to eq(5)

      delete "/api/v1/foods/#{foods[2].id}"
      expect(response).to have_http_status(204)

      get '/api/v1/foods'
      returned = JSON.parse(response.body)
      expect(returned.length).to eq(4)
    end
  end
end
