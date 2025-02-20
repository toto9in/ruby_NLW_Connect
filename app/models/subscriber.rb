class Subscriber < ApplicationRecord
  belongs_to :event
  has_many :events_link, dependent: :destroy
end
