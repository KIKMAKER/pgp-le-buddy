class FavouritesController < ApplicationController
  def fav
    @buddy_up = BuddyUp.find(params[:bu])
    @profile = @profile = current_user.profile
    @favourite = Favourite.new
    if @favourite.handle(@buddy_up, @profile)
      render partial: "favourites/favourite_button", locals: { buddy_up: @buddy_up, icon: "🌟"}
    else
      render partial: "favourites/favourite_button", locals: { buddy_up: @buddy_up, icon: "⭐️"}
    end
  end
end
