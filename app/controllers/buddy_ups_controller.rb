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
    @request = Request.new
    @challenge = Challenge.all
  end

  def new
    @source = params[:source]
    @buddy_up = BuddyUp.new
  end

  def create
    @buddy_up = BuddyUp.new(buddy_up_params)
    @buddy_up.profile = current_user.profile
    @buddy_up.challenge = Challenge.find(params[:buddy_up][:challenge_id])
    if @buddy_up.save
      if params[:source] == "buddy_up_index"
        redirect_to buddy_ups_path
      elsif params[:source] == "dashboard"
        redirect_to dashboard_path
      else
        redirect_to root_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def buddy_up_params
    params.require(:buddy_up).permit(:name, :description, :auto_match, :availability, :challenge)
  end
end
