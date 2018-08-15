class Api::V1::FoodsController < ApplicationController
  def index
    if Food.all.empty?
      render status: 404
    else
      render json: Food.all
    end
  end

  def show
    if Food.find(params[:id])
      render json: Food.find(params[:id])
    else
      render status: 404
    end
  end

  def create
    food = Food.new(name: food_params['name'], calories: food_params['calories'])
    if food.save
      render json: food
    else
      render status: 400
    end
  end

  def update
    food = Food.find(params[:id])
    food.update(name: food_params['name'], calories: food_params['calories'])
    render json: food
  end

  private

  def food_params
    params.require('food').permit('name', 'calories')
  end
end
