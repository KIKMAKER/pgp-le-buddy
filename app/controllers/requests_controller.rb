class RequestsController < ApplicationController

  def create
    @request = Request.new(request_params)
    @buddy_up = BuddyUp.find(params[:buddy_up_id])
    @request.buddy_up = @buddy_up
    @request.profile = current_user.profile
    if @request.save
      flash[:notice] = "Request sent"
      redirect_to buddy_up_path(@buddy_up)
    else
      flash[:alert] = "Failed to process request. Please try again"
      redirect_to buddy_up_path(@buddy_up)
    end
  end

  def update
    @request = Request.find(params[:id])
    @request.status = params[:action_to_take]
    @request.save
    redirect_to dashboard_path
  end

  private

  def request_params
    params.require(:request).permit(:message)
  end
end
