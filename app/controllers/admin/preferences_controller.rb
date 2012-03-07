class Admin::PreferencesController < ApplicationController
  before_filter :logged_in?
  
  layout 'admin'
  
  def index
    @preferences = Preference.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @preferences }
    end
  end
  
  def show
    @preference = Preference.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @preference }
    end
  end
  
  def new
    @preference = Preference.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @preference }
    end
  end
  
  def edit
    @preference = Preference.find(params[:id])
  end
  
  def create
    @preference = Preference.new(params[:preference])
    respond_to do |format|
      if @preference.save
        format.html { redirect_to admin_preference_path(@preference), notice: 'Preference was successfully created.' }
        format.json { render json: @preference, status: :created, location: @preference }
      else
        format.html { render action: "new" }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @preference = Preference.find(params[:id])
    respond_to do |format|
      if @preference.update_attributes(params[:preference])
        format.html { redirect_to admin_preference_path(@preference), notice: 'Preference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @preference = Preference.find(params[:id])
    @preference.destroy
    respond_to do |format|
      format.html { redirect_to admin_preferences_url }
      format.json { head :no_content }
    end
  end
end
