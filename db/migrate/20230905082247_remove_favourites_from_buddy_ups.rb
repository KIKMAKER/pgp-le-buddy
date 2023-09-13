class RemoveFavouritesFromBuddyUps < ActiveRecord::Migration[7.0]
  def change
    remove_column :buddy_ups, :favourites, :integer
  end
end
