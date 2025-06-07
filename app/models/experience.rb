class Experience < ApplicationRecord
  belongs_to :host, class_name: "User", foreign_key: "user_id"
  has_many :bookings
  has_many :reviews
  has_many :availabilities, dependent: :destroy
end
