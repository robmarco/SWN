class SwimmerActivityObserver < ActiveRecord::Observer
	observe :swimmer

	def before_update(swimmer)
		create_swimmer(swimmer, "update") if swimmer.changed?
	end

	def after_create(swimmer)
		create_swimmer(swimmer, "create")
	end

	def after_destroy(swimmer)
		create_swimmer(swimmer, "destroy")
	end

	private

	def create_swimmer(swimmer, action)
		RecentActivity.create!( 
			:user_id => swimmer.user_id, :action => action, 
			:assoc_class => "Swimmer", :assoc_id => swimmer.id, 
			:description => { "name" => "#{swimmer.name} #{swimmer.secname}", "category" => "#{swimmer.category}" } )
	end

end
