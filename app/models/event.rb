class Event < ApplicationRecord
  
  belongs_to :brewery
  has_many :event_beers
  has_many :beers, through: :event_beers

  validates :title, :scheduled_date, :location, presence: true

  def date
    scheduled_date.strftime("%B %e, %Y")
  end
end
