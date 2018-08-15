class Api::V1::MealsController < ApplicationController
  def index
    render json: Meal.all
  end

  def show
    meal = Meal.find(params[:id])
    render json: meal
  end

  def update
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    meal_food = MealFood.new(meal: meal, food: food)
    render json: { message: "Successfully added #{food.name} to #{meal.name}" }, status: 201
  end
end
