class Event < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :attendances, dependent: :destroy
  has_many :attendants, through: :attendances, source: :user
end