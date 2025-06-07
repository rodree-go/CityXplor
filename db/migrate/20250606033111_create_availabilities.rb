class CreateAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :availabilities do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.references :experience, null: false, foreign_key: true
      t.integer :seats_available

      t.timestamps
    end
  end
end
