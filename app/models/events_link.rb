class EventsLink < ApplicationRecord
  self.table_name = "events_link"

  belongs_to :event
  belongs_to :subscriber

  validates :event_id, presence: true
  validates :subscriber_id, presence: true
  validates :link, presence: true
end
