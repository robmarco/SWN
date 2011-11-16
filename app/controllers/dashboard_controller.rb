class DashboardController < ApplicationController

  def index
    @trainnings = current_user.trainnings.all
    @trials = current_user.trials.all
    @competitions = current_user.competitions.all
  end

end
