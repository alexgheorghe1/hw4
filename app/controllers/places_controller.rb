class PlacesController < ApplicationController

  def index
    @places = Place.where({user_id: session[:user_id]})
    @place = Place.new 
  end

  def show
    @place = Place.find(params["id"])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params["place"])
    @place.user_id = @current_user.id
    @place.save
    redirect_to "/places"
  end

end
