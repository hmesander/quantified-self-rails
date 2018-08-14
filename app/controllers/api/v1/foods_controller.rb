class Api::V1::FoodsController < ApplicationController
  def index
    if Food.all.empty?
      render status: 404
    else
      render json: Food.all
    end
  end
end
