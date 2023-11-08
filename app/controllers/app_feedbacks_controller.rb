class AppFeedbacksController < ApplicationController
  def index
    @app_feedbacks = AppFeedback.all
  end

  def new
    @app_feedback = AppFeedback.new
  end

  def create
    @app_feedback = AppFeedback.new(app_feedback_params)
    @app_feedback.user = current_user
    @app_feedback.datetime = Time.now
    if @app_feedback.save!
      flash[:notice] = "Thank you for your feedback!"
      redirect_to dashboard_path
    else
      flash[:alert] = "Feedback submission failed."
      render new_app_feedback_path, status: :unprocessable_entity
    end
  end

  private

  def app_feedback_params
    params.require(:app_feedback).permit(:title, :contents)
  end
end
