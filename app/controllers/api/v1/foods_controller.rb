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
end
