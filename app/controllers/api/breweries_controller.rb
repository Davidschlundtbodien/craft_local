class Api::BreweriesController < ApplicationController
  def index
    @breweries = Brewery.all()
    render 'index.json.jbuilder'
  end

  def show
    @brewery = Brewery.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @brewery = Brewery.find(params[:id])

    @brewery.name = params[:name] || @brewery.name
    @brewery.email = params[:email] || @brewery.email
    @brewery.profile_img = params[:profile_img] || @brewery.profile_img
    
    if @brewery.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @brewery.errors.full_messages}, status: 422
    end
  end
end
