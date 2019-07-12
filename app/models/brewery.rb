class Brewery < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true, length: {minimum: 2}

  has_many :beers
  has_many :events
end
