class ApplicationController < ActionController::Base
  before_filter :initialize_sessions
  
  protect_from_forgery
  
  private
  
  def initialize_sessions
    if current_user
      # When users sign_in, current_user data is stored in session variable
      session[:swimmers_size] ||= current_user.swimmers.size
      session[:trainnings_size] ||= current_user.trainnings.size
      session[:competitions_size] ||= current_user.competitions.size
      session[:trials_size] ||= current_user.trials.size    
      session[:incidents_size] ||= current_user.incidents.size
    end
  end
  
end
