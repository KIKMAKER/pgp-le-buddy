class Admin::AppFeedbacksController < ApplicationController
  before_action :allow_only_administrators

  def index
    # If there was a search form submission, do the search,
    # otherwise return all AppFeedbacks
    if params[:query].present?
      @app_feedbacks = AppFeedback.includes(:user).search(params[:query])
    else
      @app_feedbacks = AppFeedback.includes(:user).all
    end
  end

  def show
    @app_feedback = AppFeedback.find(params[:id])
  end
end
