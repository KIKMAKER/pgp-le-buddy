class Admin::FavouritesController < ApplicationController

  def destroy
    @favourite = Favourite.find(params[:id])
    @buddy_up = @favourite.buddy_up
    @favourite.destroy
    redirect_to admin_buddy_up_path(@buddy_up)
  end

end
