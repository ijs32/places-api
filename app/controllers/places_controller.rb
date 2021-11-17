class PlacesController < ApplicationController
  def index
    places = Place.all
    render json: places
  end

  def create
    places = Place.new(
      name: params[:name],
      address: params[:address]
      )
    if places.save
      render json: places
    else
      render json: {errors: places.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    place = Place.find(params[:id])
    render json: place
  end

  def update
    places = Place.find(params[:id])

    places.name = params[:name] || places.name
    places.address = params[:address] || places.address

    if places.save
      render json: places
    else
      render json: {errors: places.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy
    render json: {message: "Successfully Destroyed Place"}
  end
end
