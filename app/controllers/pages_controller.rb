class PagesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to(pages_about_url)
    end
  end
  
  def about
  end

end
