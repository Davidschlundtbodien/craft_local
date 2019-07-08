class Api::FormatsController < ApplicationController
  def index
    @formats = Format.all()
    render 'index.json.jbuilder'
  end
end
