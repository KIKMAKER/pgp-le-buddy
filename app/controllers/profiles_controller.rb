class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def index
    @profiles = Profile.all
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

  def edit_profile
    @profile = Profile.find(params[:profile_id])
    render partial: "form", locals: { profile: @profile }
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    @profile.languages = Language.where(id: params[:profile][:language_ids])
    if @profile.save
      render partial: "preview", locals: { profile: @profile }
    else
      render partial: "form", locals: { profile: @profile }, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:batch, :bio, :show_email, :language_ids)
  end
end
