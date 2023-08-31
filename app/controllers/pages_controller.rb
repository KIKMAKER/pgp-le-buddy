class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :terms, :privacy ]

  def home; end
  def terms; end
  def privacy; end
end
