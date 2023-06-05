class PlacesController < ApplicationController

  def index
    if @current_user
      @places = Place.where(user_id: @current_user.id)
    else
      @places = []
    end
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"], "user_id" => session["user_id"] })
  end  

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place["user_id"] = @current_user.id
    @place.save
    redirect_to "/places"
  end

end
