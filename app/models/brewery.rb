class Brewery < ApplicationRecord
  
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true, length: {minimum: 2}
  validates :address, presence: true
  
  has_many :beers
  has_many :events

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?


end
