require 'rails_helper'

describe 'Foods API' do
  it 'sends a list of foods' do
    create_list(:food, 5)

    get '/api/v1/foods'

    expect(response).to have_http_status(200)

    foods = JSON.parse(response.body)

    expect(foods.length).to eq(5)
  end
end
