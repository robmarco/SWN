class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @recent_activities = current_user.recent_activities.paginate(:page => params[:page], :per_page => 7).order("created_at DESC")
    
    today = Date.today
    wkBegin = Date.commercial(today.cwyear, today.cweek, 1)
    wkEnd = Date.commercial(today.cwyear, today.cweek, 7)

    @trainnings = current_user.trainnings.where(:date_trainning => wkBegin..wkEnd)
    @trials = current_user.trials.where(:date_trial => wkBegin..wkEnd)
    @competitions = current_user.competitions.where(:date_competition => wkBegin..wkEnd)
    
    respond_to do |format|
      format.html
      format.js
    end
    
  end

end
