class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # This will check if the user has updated their profile when signing in if not redirect them to profile show
  def after_sign_in_path_for(resource)
    if @user.registered?
      profile_path(@user.profile)
    else
      super
    end
  end
end
