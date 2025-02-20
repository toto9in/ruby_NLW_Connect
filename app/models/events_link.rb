class EventsLink < ApplicationRecord
  belongs_to :event
  belongs_to :subscriber
end
