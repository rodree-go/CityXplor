class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :category
      t.string :title
      t.string :location
      t.text :description
      t.float :rating
      t.float :price
      t.integer :seats
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
