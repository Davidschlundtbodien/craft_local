class Brewery < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :beers
  has_many :events
end
