class Format < ApplicationRecord
  has_many :beer_formats
  has many :beers, through: :beer_formats
end
