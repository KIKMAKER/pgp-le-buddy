class BuddyUpsController < ApplicationController
  def index
    # This renders the global "Marketplace" page.
    @buddy_ups = BuddyUp.where(status: "active")
  end

  def show
    @buddy_up = BuddyUp.find(params[:id])
    @request = Request.new
  end
end
