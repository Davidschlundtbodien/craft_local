Rails.application.routes.draw do
  namespace :api do
    #Beer routes
    get "/beers" => "beers#index"
    get "/beers/:id" => "beers#show"
    post "/beers" => "beers#create"
    patch "/beers/:id" => "beers#update"
    delete "/beers/:id" => "beers#destroy"

    #Event routes
    get "/events" => "events#index"
    get "/events/:id" => "events#show"
    post "/events" => "events#create"
    patch "/events/:id" => "events#update"
    delete "/events/:id" => "events#destroy"

    #Brewery routes
    get "/breweries" => "breweries#index"
    get "/breweries/:id" => "breweries#show"
    # post "/breweries" => "breweries#create"
    patch "/breweries/:id" => "breweries#update"
    # delete "/breweries/:id" => "breweries#destroy"

    #Join tables
    post "/beer_formats" => "beer_formats#create"
    delete "/beer_formats/:id" => "beer_formats#destroy"
    post "/event_beers" => "event_beers#create"
    delete "/event_beers/:id" => "event_beers#destroy"
  end
end
