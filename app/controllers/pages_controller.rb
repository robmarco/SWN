class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :about]
  
  def index
    if user_signed_in?
      redirect_to(pages_dashboard_url)
    end
  end
  
  def about
  end
  
  def dashboard
    # When users sign_in, current_user data is stored in session variable
    session[:swimmers_size] ||= current_user.swimmers.size
    session[:trainnings_size] ||= current_user.trainnings.size
    session[:competitions_size] ||= current_user.competitions.size
    session[:trials_size] ||= current_user.trials.size    
    session[:incidents_size] ||= current_user.incidents.size   
  end
end
