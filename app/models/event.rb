class Event < ApplicationRecord
  has_many :subscribers, dependent: :destroy
  has_many :events_link, dependent: :destroy

  validates :name, presence: true
end
