class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :terms ]

  def home; end

  def terms; end
end
