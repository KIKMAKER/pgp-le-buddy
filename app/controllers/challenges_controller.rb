class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def update
    @challenge = Challenge.find(params[:id])
    if @challenge.update(challenge_params) && valid_referer?
      @challenges = Challenge.all
      render "admin_index"
    else
      render :admin_edit, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to root_path and return unless valid_referer?
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    render "admin_index"
  end

  private

  def challenge_params
    params.require(:challenge).permit(:name, :skill, :module, :url_fragment)
  end
end
