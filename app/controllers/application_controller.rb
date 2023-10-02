class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # This will check if the user has updated their profile (via the registered enum) when signing in if not redirect them to profile show
  def after_sign_in_path_for(resource)
    if @user.registered?
      profile_path(@user.profile)
    else
      super
    end
  end

  # Guard the paths in the Admin control panel against unauthorised
  # execution via URL entries by making sure the referer is the admin
  # control panel page.
  def valid_referer?
    # return true if the refering page is the admin control panel, otherwise false
    # TODO: when going to production and the site domain is known, replace this
    # regex with the full domain path.
    if request.env["HTTP_REFERER"]
      path = request.env["HTTP_REFERER"].match(/.*\/(admin)\z/)[1]
    end
    path === "admin" ? true : false
  end
end
