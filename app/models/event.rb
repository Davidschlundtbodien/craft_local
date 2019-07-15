class Event < ApplicationRecord
  
  belongs_to :brewery
  has_many :event_beers
  has_many :beers, through: :event_beers

  validates :title, :scheduled_date, :location, presence: true

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  def date
    scheduled_date.strftime("%A, %d %b %Y %l:%M %p")
  end
end
