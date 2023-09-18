class ProfileLanguagesController < ApplicationController

  def create
    @profile_language = ProfileLanguage.new(profile_language_params)
    @profile_language.profile = current_user.profile
    if @profile_language.save
      @new_profile_language = ProfileLanguage.new
      @profile_languages = current_user.profile.profile_languages.includes(:language)
      render partial: 'profile_languages/languages', locals: { profile_language: @new_profile_language, profile_languages:  @profile_languages }
    else
      @profile_languages =  current_user.profile.profile_languages.includes(:language)
      render partial: 'profile_languages/languages', locals: { profile_language: @profile_language, profile_languages: @profile_languages }, status: :unprocessable_entity
    end
  end

  def destroy
    @profile_language = ProfileLanguage.find(params[:id])
    @profile_language.destroy
    @new_profile_language = ProfileLanguage.new
    @profile_languages = current_user.profile.profile_languages.includes(:language)
    render partial: 'profile_languages/languages', locals: { profile_language: @new_profile_language, profile_languages:  @profile_languages }
  end
  private

  def profile_language_params
    params.require(:profile_language).permit(:language_id, :profile_id)
  end
end
