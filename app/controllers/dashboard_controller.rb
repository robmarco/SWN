class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @recent_activities = current_user.recent_activities.order("created_at DESC").first(10)
    
    @trainnings = current_user.trainnings.where(:date_trainning => Date.today)
    @trials = current_user.trials.where(:date_trial => Date.today)
    @competitions = current_user.competitions.where(:date_competition => Date.today)
  end

end
