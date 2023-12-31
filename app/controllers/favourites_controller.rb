class FavouritesController < ApplicationController
  def create
    @buddy_up = BuddyUp.find(params[:bu])
    @profile = current_user.profile
    @favourite = Favourite.new
    if @favourite.handle(@buddy_up, @profile)
      render partial: "favourites/favourite_button", locals: { buddy_up: @buddy_up, profile: @profile}
    end
  end

  def destroy
    # Find the favourites for this user and this BuddyUp.
    @buddy_up = BuddyUp.find(params[:id])
    @profile = current_user.profile
    @favourites = Favourite.where(buddy_up: @buddy_up, profile: @profile)

    # There should be only one, but regardless destroy them all.
    @favourites.each do |favourite|
      favourite.destroy
    end

    # Get all the favourites BuddyUps for this user and render a new index.
    @fav_bups = @profile.fav_buddy_ups
    render partial: "favourites/dashboard_index", locals: { fav_bups: @fav_bups }
  end

end
