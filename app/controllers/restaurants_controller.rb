class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :chef]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def italian
    @restaurants = Restaurant.where(category: 'italian')
  end

  def chef
  end

  def top
    # @top_restaurants = Restaurant.where('average_rating > ?', 2).order(average_rating: :desc)
    @top_restaurants = Restaurant.order(average_rating: :desc).limit(5)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category, :chef_name)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
