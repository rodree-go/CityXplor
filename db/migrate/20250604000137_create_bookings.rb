class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.time :start_time
      t.time :end_time
      t.references :user, null: false, foreign_key: true
      t.references :experience, null: false, foreign_key: true

      t.timestamps
    end
  end
end
