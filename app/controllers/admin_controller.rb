class AdminController < ApplicationController
  before_filter :logged_in?
  def index
  end
end
