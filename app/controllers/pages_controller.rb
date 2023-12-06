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
    @join_requests = requested_from_me(@profile)
  end

  private

  def requested_from_me(profile)
    my_bups = BuddyUp.where(profile: profile)
    requests = []
    my_bups.each do |bu|
      bu.requests.each do |re|
        requests << re
      end
    end
    return requests
  end

end
