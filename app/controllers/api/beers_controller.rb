class Api::BeersController < ApplicationController

  before_action :authenticate_user, except: [:show, :index]

  def index
    @beers = Beer.all()
    render 'index.json.jbuilder'
  end

  def show
    @beer = Beer.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @beer = Beer.new(
      name: params[:name],
      style: params[:style],
      ibu: params[:ibu],
      srm: params[:srm],
      description: params[:description],
      glassware: params[:glassware],
      image: params[:image],
      abv: params[:abv],
      brewery_id: current_user.id
    )
    if @beer.save
      #eval()
      format_ids = params[:format_ids]
      format_ids.each do |format_id|
        BeerFormat.create(beer_id: @beer.id, format_id: format_id)
      end 

      render 'show.json.jbuilder'
    else
      render json: {errors: @beer.errors.full_messages}, status: 422
    end
  end
    
  def update
    @beer = Beer.find(params[:id])

    @beer.name = params[:name] || @beer.name
    @beer.style = params[:style] || @beer.style
    @beer.ibu = params[:ibu] || @beer.ibu
    @beer.srm = params[:srm] || @beer.srm
    @beer.description = params[:description] || @beer.description
    @beer.glassware = params[:glassware] || @beer.glassware
    @beer.image = params[:image] || @beer.image
    @beer.abv = params[:abv] || @beer.abv

    @current = BeerFormat.where(beer_id: @beer.id)
    @current.destroy_all

    format_ids = params[:format_ids]
    format_ids.each do |format_id|
      BeerFormat.create(beer_id: @beer.id, format_id: format_id)
    end 

    if @beer.save
      if params[:formats]
        @current.destroy_all
      end
      render 'show.json.jbuilder'
    else
      render json: {errors: @beer.errors.full_messages}, status: 422
    end
  end

  def destroy
    @beer = Beer.find(params[:id])

    @current = BeerFormat.where(beer_id: @beer.id)
    @current.destroy_all

    @beer.destroy
    render json: {message: "Beer successfully destroyed!"}
  end

end
