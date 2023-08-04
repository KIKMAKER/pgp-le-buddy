class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :github

  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
    else
      flash[:error]='There was a problem signing you in through Github. Please try signing in later.'
            redirect_to new_user_session_url
    end
  end

  def failure
    flash[:error] = 'There was a problem signing you in. Please try signing in later.'
    redirect_to root_path
  end
end
