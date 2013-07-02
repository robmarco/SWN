class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :about, :tour, :terms, :contact]
  before_filter :redirect_if_logged_in
  
  layout "index_theme"
  
  def index
    
  end
  
  def tour    
  end

  def about
  end
  
  def contact  	
  end

  def terms
  end
  
  private

  def redirect_if_logged_in
    if user_signed_in?
      redirect_to(dashboard_url)
    end
  end
end
