class Admin::DashboardController < ApplicationController
  before_action :allow_only_administrators

  def index
    @active_users_count = User.where(status: :active).count
    @away_users_count = User.where(status: :away).count
    @active_bups = BuddyUp.where(status: :active).count
    @complete_bups = BuddyUp.where(status: :complete).count
  end

end
