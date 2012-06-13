class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :about]
  
  def index
    if user_signed_in?
      redirect_to(dashboard_url)
    end
  end
  
  def about
  end
  
end
