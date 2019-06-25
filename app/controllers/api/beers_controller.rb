class Api::BeersController < ApplicationController

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
      brewery_id: params[:brewery_id]
    )
    if @beer.save

      formats = params[:formats].split("").map(&:to_i)
      formats.each do |format|
        BeerFormat.create(beer_id: @beer.id, format_id: format)
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

    if @beer.save
      if params[:formats]
        
        @current = BeerFormat.where(beer_id: @beer.id)
        @current.destroy_all

        formats = params[:formats].split("").map(&:to_i)
        formats.each do |format|
          BeerFormat.create(beer_id: @beer.id, format_id: format)
        end 
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
