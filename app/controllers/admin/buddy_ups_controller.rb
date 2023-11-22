class Admin::BuddyUpsController < ApplicationController
  before_action :allow_only_administrators
  before_action :find_buddy_up, only: [ :update, :destroy ]

  def index
    # If there was a search form submission, do the search,
    # otherwise return all the BuddyUps.
    if params[:query].present?
      @buddy_ups = BuddyUp.search(params[:query])
    else
      @buddy_ups = BuddyUp.includes(:user).all
    end
  end

  def show
    @buddy_up = BuddyUp.includes(
      :requests,
      :favourites,
      :feedbacks,
      :user,
      :challenge
      ).find(params[:id])
  end

  def update
    # handle status change buttons
    @buddy_up.change_status(params[:status_change]) if params[:status_change]

    redirect_to admin_buddy_up_path(@buddy_up)
  end

  def destroy
    @buddy_up.destroy
    redirect_to admin_buddy_ups_path
  end

  private

    def find_buddy_up
      @buddy_up = BuddyUp.find(params[:id])
    end

end
