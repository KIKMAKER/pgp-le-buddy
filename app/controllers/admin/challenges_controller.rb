class Admin::ChallengesController < ApplicationController
  before_action :allow_only_administrators

  def index
    # If there was a search form submission, do the search,
    # otherwise return all challenges
    if params[:query].present?
      @challenges = Challenge.search(params[:query])
    else
      @challenges = Challenge.all
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])
    if @challenge.update(challenge_params)
      flash[:notice] = "Changes saved"
      redirect_to edit_admin_challenge_path(@challenge)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    def challenge_params
      params.require(:challenge).permit(:name, :skill, :module, :url_fragment)
    end

end
