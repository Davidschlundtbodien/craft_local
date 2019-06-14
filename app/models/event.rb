class Event < ApplicationRecord
  belongs_to :brewery
  has_many :event_beers
  has_many :beers, through: :event_beers
end
