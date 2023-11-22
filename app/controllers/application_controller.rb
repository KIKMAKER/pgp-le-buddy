class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # This will check if the user has updated their profile (via the registered enum)
  # when signing in and, if not, redirect them to profile show
  def after_sign_in_path_for(resource)
    if @user.registered?
      profile_path(@user.profile)
    else
      super
    end
  end

  # Guard admin pages by checking that the user is an administrator
  def allow_only_administrators
    unless current_user.admin
      flash[:alert] = "Access denied"
      redirect_to dashboard_path
    end
  end
end
