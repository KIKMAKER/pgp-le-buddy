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
  
  # --------------- Admin dashboard ---------------
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
  
  def admin_users
    render partial: "pages/admin_users"
  end
  
  def admin_bups
    render partial: "pages/admin_bups"
  end
  
  def admin_challenges
    render partial: "pages/admin_challenges"
  end
  
  def admin_app_feedbacks
    render partial: "pages/admin_app_feedbacks"
  end
  
  # ------------- end admin dashboard -------------
  
end
