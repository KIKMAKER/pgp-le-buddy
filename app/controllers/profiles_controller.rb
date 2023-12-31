class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])

    # data for the sidebar
    @active_bups = BuddyUp.active_list(@profile)
    @requested_bups = Request.requested(@profile)
    @request_success_rate = Request.success_rate(@profile)
    @complete_bups = BuddyUp.complete_list(@profile)
    @archive_bups = BuddyUp.archive_list(@profile)
    @progress = BuddyUp.progress(@profile)
    @count = BuddyUp.active_complete_total(@profile)
    @all_count = BuddyUp.all_count(@profile)
    @abandonment = BuddyUp.abandonment(@profile)
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.languages = Language.where(id: params[:profile][:language_ids])
    if @profile.save
      redirect_to profile_path(@profile) # maybe some logic to check if you have social links if not we redirect to social links new
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = Profile.find(params[:id])

    # data for the sidebar
    @active_bups = BuddyUp.active_list(@profile)
    @requested_bups = Request.requested(@profile)
    @request_success_rate = Request.success_rate(@profile)
    @complete_bups = BuddyUp.complete_list(@profile)
    @archive_bups = BuddyUp.archive_list(@profile)
    @progress = BuddyUp.progress(@profile)
    @count = BuddyUp.active_complete_total(@profile)
    @all_count = BuddyUp.all_count(@profile)
    @abandonment = BuddyUp.abandonment(@profile)

    # set up the edit form
    @new_profile_language = ProfileLanguage.new
    @profile_languages = current_user.profile.profile_languages.includes(:language)
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    if @profile.save
      # a user becomes active once they have updated their profile
      current_user.active! if current_user.registered?
      redirect_to profile_path(@profile)
    else
      @new_profile_language = ProfileLanguage.new
      @profile_languages = current_user.profile.profile_languages.includes(:language)
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:batch, :bio, :show_email, :language_ids)
  end
end
