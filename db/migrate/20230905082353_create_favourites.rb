class CreateFavourites < ActiveRecord::Migration[7.0]
  def change
    create_table :favourites do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :buddy_up, null: false, foreign_key: true

      t.timestamps
    end
  end
end
