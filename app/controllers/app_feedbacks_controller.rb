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
      # This needs some consideration depending on where the link to the new form
      # will appear in the app. Sending them to the marketplace is probably a
      # good option but that part of the app is still in PR at the time of writing
      # this.
      redirect_to root_path
    else
      render new_app_feedback_path, status: :unprocessable_entity
    end
  end

  private

  def app_feedback_params
    params.require(:app_feedback).permit(:title, :contents)
  end
end
