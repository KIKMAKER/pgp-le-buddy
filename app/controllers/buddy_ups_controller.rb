class BuddyUpsController < ApplicationController
  def index
    # This renders the global "Marketplace" page.
    @buddy_ups = BuddyUp.where(status: "active")
    @profile = current_user.profile
  end

  def admin_set_status_active
    redirect_to root_path and return unless valid_referer?
    @bu = BuddyUp.find(params[:id])
    @bu.active!
    render "buddy_ups/admin_show"
  end

  def admin_set_status_archived
    redirect_to root_path and return unless valid_referer?
    @bu = BuddyUp.find(params[:id])
    @bu.archived!
    render "buddy_ups/admin_show"
  end

  def admin_set_status_complete
    redirect_to root_path and return unless valid_referer?
    @bu = BuddyUp.find(params[:id])
    @bu.complete!
    render "buddy_ups/admin_show"
  end

  def admin_delete
    redirect_to root_path and return unless valid_referer?
    @bu = BuddyUp.find(params[:id])
    @bu.destroy
    @bups = BuddyUp.all
    render "admin_index"
  end

  def admin_index
    redirect_to root_path and return unless valid_referer?
    # If there was a search form submission, do the search,
    # otherwise return all the BuddyUps.
    if params[:query].present?
      @bups = BuddyUp.search(params[:query])
    else
      @bups = BuddyUp.all
    end
    # render partial: "admin_index"
  end

  def admin_bups_user
    redirect_to root_path and return unless valid_referer?
    @user = User.find(params[:id])
    @bups = @user.buddy_ups
    render "admin_index"
  end

  def admin_show
    redirect_to root_path and return unless valid_referer?
    @bu = BuddyUp.find(params[:id])
    render "admin_show"
  end
end
