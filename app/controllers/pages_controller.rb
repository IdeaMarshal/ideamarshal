class PagesController < ApplicationController
  def show
    @page = Page.find_by_url params[:id]
    not_found("No Page with URL '#{params[:id]}' found") if @page.nil?
  end
end
