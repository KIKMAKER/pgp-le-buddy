class Favourite < ApplicationRecord
  belongs_to :profile
  belongs_to :buddy_up
  has_one :user, through: :profile

  # Here we handle the click on a favourite button
  # If the user (profile) has already favourited this particular BuddyUp, that
  # favourite will be removed, otherwise, if they have not yet favourited this
  # BuddyUp then their favourite will be created.
  def handle(buddy_up, profile)
    existing_favourites = Favourite.where(buddy_up: , profile:)
    if existing_favourites.empty?
      favourite = Favourite.new
      favourite.buddy_up = buddy_up
      favourite.profile = profile
      favourite.save
    else
      existing_favourites.each do |f|
        f.destroy
      end
    end
    return true
  end
end
