class Admin::UsersController < ApplicationController
  before_action :allow_only_administrators

  def index
    # If there was a search form submission, do the search,
    # otherwise return all the users.
    if params[:query].present?
      @users = User.search_user_profile(params[:query])
    else
      @users = User.all
    end
  end

  def show
    @user = User.includes(
      :profile,
      :social_links,
      :buddy_ups,
      :favourites,
      :requests,
      :profile_languages
    ).find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    # handle status change buttons
    @user.change_status(params[:status_change]) if params[:status_change]

    redirect_to admin_user_path(@user)
  end

end
