class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @recent_activities = current_user.recent_activities.paginate(:page => params[:page], :per_page => 7).order("created_at DESC")
    @trainnings = current_user.trainnings.this_week
    @trials = current_user.trials.this_week
    @competitions = current_user.competitions.this_week
    
    respond_to do |format|
      format.html
      format.js
    end
    
  end

end
