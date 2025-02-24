class Event < ApplicationRecord
  belongs_to :event_creator, class_name: "User"

  has_many :attendee_attended_events, foreign_key: :attended_event_id
  has_many :attendees, through: :events_to_attend, source: :attendee

  scope :past, -> { where(event_date: ..(Time.now.midnight)) }
  scope :future, -> { where(event_date: (Time.now.midnight)..) }
end