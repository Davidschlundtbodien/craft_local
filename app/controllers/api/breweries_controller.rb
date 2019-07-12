class Api::BreweriesController < ApplicationController

  before_action :authenticate_user, except: [:index, :show, :create]

  def index
    @breweries = Brewery.all()
    render 'index.json.jbuilder'
  end

  def show
    @brewery = Brewery.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    brewery = Brewery.new(
      name: params[:name],
      address: params[:address],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if brewery.save
      render json: {message: 'Account created successfully'}, status: :created
    else
      render json: {errors: brewery.errors.full_messages}, status: :bad_request
    end
  end

  def update
    @brewery = Brewery.find(params[:id])

    @brewery.name = params[:name] || @brewery.name
    @brewery.email = params[:email] || @brewery.email
    @brewery.profile_img = params[:profile_img] || @brewery.profile_img
    @brewery.address = params[:address] || @brewery.address
    
    if @brewery.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @brewery.errors.full_messages}, status: 422
    end
  end

  def destroy
    @brewery = Brewery.find(params[:id])

    @brewery_beers = Beer.where(brewery_id: @brewery.id)
    @brewery_events = Event.where(brewery_id: @brewery.id)
    @brewery_beers.destroy_all
    @brewery_events.destroy_all


    @brewery.destroy
    render json: {message: "Brewery successfully destroyed!"}
  end

end
