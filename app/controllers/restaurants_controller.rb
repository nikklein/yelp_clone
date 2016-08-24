class RestaurantsController < ApplicationController
  before_action :authenticate_user!, :expect => [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
     redirect_to restaurants_path
    else
     render 'new'
    end
  end

  def show
    find_current_restaurant
  end

  def edit
    find_current_restaurant
  end

  def update
    find_current_restaurant
    if @restaurant.user == current_user
      @restaurant.update(restaurant_params)
      redirect_to '/restaurants'
    end
  end

  def destroy
    find_current_restaurant
    if @restaurant.user == current_user
      @restaurant.destroy
      flash[:notice] = "Restaurant deleted successfully"
      redirect_to '/restaurants'
    end
  end

  def find_current_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

end
