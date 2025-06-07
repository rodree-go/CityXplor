class AddAvailabilityToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :availability, foreign_key: true
  end
end
