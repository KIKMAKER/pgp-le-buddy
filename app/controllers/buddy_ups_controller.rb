class BuddyUpsController < ApplicationController
  def index
    # This renders the global "Marketplace" page.
    @buddy_ups = BuddyUp.where(status: "active")
  end
end
