class EventBeer < ApplicationRecord
  belongs_to :beer
  belongs_to :event
end
