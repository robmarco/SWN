class AjaxController < ApplicationController
  before_filter :authenticate_user!

  def swimmers
  	@swimmers = current_user.swimmers.select("id,name,secname,email")
  	list = @swimmers.map {|a| Hash[ id: a.id, name: [a.name, a.secname].join(' ')]}
  	render json: list
  end

end
