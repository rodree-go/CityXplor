class Experience < ApplicationRecord
  belongs_to :host, class_name: "User", foreign_key: "user_id"
  has_many :bookings
  has_many :reviews

  def available_seats
    self.seats - self.bookings.size
  end

end
