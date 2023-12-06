class BuddyUpsController < ApplicationController

  def index
    # This renders the global "Marketplace" page.
    @buddy_ups = BuddyUp.includes(
      :challenge,
      :favourites
    ).where(status: "active")
    @profile = Profile.where(user: current_user).load_async
  end

  def show
    @buddy_up = BuddyUp.find(params[:id])
  end

end
