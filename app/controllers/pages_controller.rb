class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :terms, :privacy, :team ]

  def home; end
  def terms; end
  def privacy; end
  def team; end

  def dashboard
    @profile = current_user.profile
    @active_bups = BuddyUp.active_list(@profile)
    @requested_bups = Request.requested(@profile)
    @request_success_rate = Request.success_rate(@profile)
    @complete_bups = BuddyUp.complete_list(@profile)
    @archive_bups = BuddyUp.archive_list(@profile)
    @progress = BuddyUp.progress(@profile)
    @count = BuddyUp.active_complete_total(@profile)
    @all_count = BuddyUp.all_count(@profile)
    @abandonment = BuddyUp.abandonment(@profile)
    @fav_bups = @profile.fav_buddy_ups
  end
  
  def admin
    if current_user.admin
      @active_users_count = User.where(status: :active).count
      @away_users_count = User.where(status: :away).count
      @active_bups = BuddyUp.where(status: :active).count
      @complete_bups = BuddyUp.where(status: :complete).count
    else
      redirect_to root_path
    end
  end
end
