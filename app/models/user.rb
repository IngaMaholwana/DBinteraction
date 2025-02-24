class User < ApplicationRecord
  # Indixakile lendawo
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: "author_id"
  has_many :attendances, dependent: :destroy
  has_many :attended_events, through: :attendances, source: :event
end