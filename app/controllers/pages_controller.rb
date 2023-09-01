class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :terms, :privacy, :team ]

  def home; end
  def terms; end
  def privacy; end
  def team; end
end
