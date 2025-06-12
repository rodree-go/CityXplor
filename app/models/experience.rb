class Experience < ApplicationRecord
  belongs_to :host, class_name: "User", foreign_key: "user_id"
  has_many :bookings
  has_many :reviews
  has_one_attached :photo

  def available_seats
    self.seats - self.bookings.size
  end
end
