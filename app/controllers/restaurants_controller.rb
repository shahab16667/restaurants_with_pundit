class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  
  def index
    @restaurants = Restaurant.all
  end

 
  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

 
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save 
      redirect_to @restaurant, notice: 'Restaurant was successfully created'
    else
      render :new
    end
    
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    if @restaurant.update(restautant_params)
      redirect_to @restaurant, notice: 'Restaurant was successfully updated'
    else
      render :edit

    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: 'Restaurant was successfully removed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :user_id)
    end
end
