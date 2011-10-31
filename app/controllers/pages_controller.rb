class PagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to(pages_dashboard_url)
    end
  end
  
  def about
  end
  
  def dashboard
    # When users sign_in, current_user data is stored in session variable
    session[:swimmers_size] ||= current_user.swimmers.all.size
    session[:competitions_size] ||= current_user.competitions.all.size
    session[:trials_size] ||= current_user.trials.all.size
    
  end
end
