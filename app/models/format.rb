class Format < ApplicationRecord
  has_many :beer_formats
  has_many :beers, through: :beer_formats
end
