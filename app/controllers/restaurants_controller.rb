class RestaurantsController < ApplicationController
  def index
    @restaurants = get_user.restaurants
    @restaurant_details_array = @restaurants.collect {|r| a = [r.name, r.lat, r.lng, r.address]}
    # byebug
  end


  def new
    search_term = params[:search].split(' ').join('%20')
    search_results = RestClient.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.763724,-73.976680&radius=45000&name=#{search_term}&key={my-Key")

    @search_array = JSON.parse(search_results)["results"][0..2]
    # byebug
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    @my_restaurant = RestaurantsUser.new(user_id: get_user.id, restaurant_id: Restaurant.find_by(place_id: @restaurant.place_id).id)
    @my_restaurant.save
    redirect_to restaurants_path
  end

  def destroy
    RestaurantsUser.find_by(restaurant_id: params[:id], user_id: session[:user_id]).destroy
    redirect_to restaurants_path
  end


  private


  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :place_id, :lat, :lng)
  end

  def get_user
    User.find(session[:user_id])
  end


end
