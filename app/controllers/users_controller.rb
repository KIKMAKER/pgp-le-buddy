class UsersController < ApplicationController

  def admin_index
    redirect_to root_path and return unless valid_referer?
    # If there was a search form submission, do the search,
    # otherwise return all the users.
    if params[:query].present?
      @users = User.search_user_profile(params[:query])
    else
      @users = User.all
    end
  end

  def admin_show
    redirect_to root_path and return unless valid_referer?
    @user = User.find(params[:id])
  end

  def admin_set_away
    redirect_to root_path and return unless valid_referer?
    @user = User.find(params[:id])
    @user.away!
    render "users/admin_show"
  end

  def admin_set_active
    redirect_to root_path and return unless valid_referer?
    @user = User.find(params[:id])
    @user.active!
    render "users/admin_show"
  end

  def admin_set_dummy
    redirect_to root_path and return unless valid_referer?
    @user = User.find(params[:id])
    @user.dummy!
    render "users/admin_show"
  end

  def admin_toggle_admin
    redirect_to root_path and return unless valid_referer?
    @user = User.find(params[:id])
    @user.admin ? @user.admin = false : @user.admin = true
    @user.save
    render "users/admin_show"
  end

end
