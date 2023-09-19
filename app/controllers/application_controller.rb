class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if @user.profile.batch.nil?
      profile_path(@user.profile)
    else
      super
    end
  end
end
