class AddImageUrlToExperiences < ActiveRecord::Migration[7.1]
  def change
    add_column :experiences, :img_url, :string
  end
end
