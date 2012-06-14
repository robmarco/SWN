class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :initialize_sessions
  
  #rescue_from ActiveRecord::RecordNotFound do
  #  render :file => "#{Rails.root}/public/404.html", :layout => false, :status => 404
  #end
  
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
  
<<<<<<< HEAD
end
=======
end
>>>>>>> origin/master
