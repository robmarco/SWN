class RegistrationsController < Devise::RegistrationsController
	def edit
		render :edit, :layout => false
	end
end