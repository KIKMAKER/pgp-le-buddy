class ProfileController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def index
    @profiles = Profile.all
  end
end
