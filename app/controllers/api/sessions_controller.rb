class Api::SessionsController < ApplicationController

  def create
    brewery = Brewery.find_by(email: params[:email])
    if brewery && brewery.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: brewery.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: brewery.email, user_id: brewery.id, user_name: brewery.name}, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end

end
