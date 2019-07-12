class Beer < ApplicationRecord

  has_many :event_beers
  has_many :beer_formats
  belongs_to :brewery
  has_many :formats, through: :beer_formats
  has_many :events, through: :event_beers 

  validates :name, :style, :abv, presence: true 
  validates :name, uniqueness: true

  def last_updated
    updated_at.strftime("%B %e, %Y")
  end

  def released
    created_at.strftime("%B %e, %Y")
  end
end
