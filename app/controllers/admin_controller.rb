class AdminController < ApplicationController
  before_filter :logged_in?
  
  layout 'admin'
  
  def index
  end
end
