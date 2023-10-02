class RequestsController < ApplicationController
  def admin_delete
    @request = Request.find(params[:id])
    @bu = @request.buddy_up
    @request.destroy
    render "buddy_ups/admin_show"
  end
end
