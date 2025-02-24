class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Events created by the user
  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  
  # Events attended by the user
  has_many :event_attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendances, source: :event
end