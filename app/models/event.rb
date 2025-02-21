class Event < ApplicationRecord
  has_many :subscribers, dependent: :destroy
  has_many :events_link, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :link, presence: false
  validates :event_id, presence: true
  validate  :event_must_exist

  private

  def event_must_exist
    errors.add(:event_id, "must exist") unless Event.exists?(self.event_id)
  end
end
