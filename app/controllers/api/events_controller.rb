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
      schedule_date: params[:schedule_date],
      location: params[:location],
      content: params[:content],
      image: params[:image],
      brewery_id: params[:brewery_id]
    )
    if @event.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @event.errors.full_messages}, status: 422
    end
  end
    
  def update
    @event = Event.find(params[:id])

    @event.title = params[:title] || @event.title
    @event.schedule_date = params[:schedule_date] || @event.schedule_date
    @event.location = params[:location] || @event.location
    @event.content = params[:content] || @event.content
    @event.image = params[:image] || @event.image

    if @event.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @event.errors.full_messages}, status: 422
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    render json: {message: "Event successfully Cancelled!"}
  end
end
