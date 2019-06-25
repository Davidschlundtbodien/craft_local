class Api::EventsController < ApplicationController
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
      brewery_id: params[:brewery_id]
    )
    if @event.save
      beers = params[:beers].split("").map(&:to_i)
      beers.each do |beer|
        EventBeer.create(event_id: @event.id, beer_id: beer)
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

    if @event.save
      if params[:beers]
        
        @current =EventBeer.where(event_id: @event.id)
        @current.destroy_all

        beers = params[:beers].split(",").map(&:to_i)
        beers.each do |beer|
          EventBeer.create(beer_id: beer, event_id: @event.id)
        end 

      end
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
