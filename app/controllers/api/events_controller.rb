class Api::EventsController < ApplicationController

  before_action :authenticate_user, except: [:show, :index]

  def index
    @events = Event.all()
    render 'index.json.jbuilder'
  end

  def show
    @event = Event.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @event = Event.new(
      title: params[:title],
      scheduled_date: params[:scheduled_date],
      location: params[:location],
      content: params[:content],
      image: params[:image],
      brewery_id: current_user.id
    )
    if @event.save
      beer_ids = params[:beer_ids]
      beer_ids.each do |beer_id|
        EventBeer.create(event_id: @event.id, beer_id: beer_id)
      end 
      render 'show.json.jbuilder'
    else
      render json: {errors: @event.errors.full_messages}, status: 422
    end
  end
    
  def update
    @event = Event.find(params[:id])

    @event.title = params[:title] || @event.title
    @event.scheduled_date = params[:scheduled_date]  || @event.scheduled_date
    @event.location = params[:location] || @event.location
    @event.content = params[:content] || @event.content
    @event.image = params[:image] || @event.image

    @current =EventBeer.where(event_id: @event.id)
    @current.destroy_all

    beer_ids = params[:beer_ids]
    beer_ids.each do |beer_id|
      EventBeer.create(event_id: @event.id, beer_id: beer_id)
    end 

    if @event.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @event.errors.full_messages}, status: 422
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @current =EventBeer.where(event_id: @event.id)
    @current.destroy_all

    @event.destroy
    render json: {message: "Event successfully Cancelled!"}
  end
end
