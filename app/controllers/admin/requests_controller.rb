class Admin::RequestsController < ApplicationController
  before_action :allow_only_administrators

  def destroy
    @request = Request.find(params[:id])
    @buddy_up = @request.buddy_up
    @request.destroy
    redirect_to admin_buddy_up_path(@buddy_up)
  end

end
