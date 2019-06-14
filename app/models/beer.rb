class Beer < ApplicationRecord
  has_many :event_beers
  has_many :beer_formats
  belongs_to :brewery
  has_many :formats, through: :beer_formats
  has_many :events, through: :event_beers 
end
