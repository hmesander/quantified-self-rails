class Api::V1::FoodsController < ApplicationController
  def index
    if Food.all.empty?
      render status: 404
    else
      render json: Food.all
    end
  end

  def show
    render json: Food.find(params[:id])
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
    if food.update(name: food_params['name'], calories: food_params['calories'])
      render json: food
    else
      render status: 400
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    render status: 204
  end

  private

  def food_params
    params.require('food').permit('name', 'calories')
  end
end
