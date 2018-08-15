class Api::V1::MealFoodsController < ApplicationController
  def create
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    meal_food = MealFood.create!(meal: meal, food: food)
    render json: { message: "Successfully added #{food.name} to #{meal.name}" }, status: 201
  end

  def destroy
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    meal_food = MealFood.find_by(meal: meal, food: food)
    meal_food.destroy!
    render json: { message: "Successfully deleted #{food.name} from #{meal.name}" }, status: 200
  end
end
