class TrainningActivityObserver < ActiveRecord::Observer
	observe :trainning

	def before_update(trainning)
		create_trainning(trainning, "update") if trainning.changed?
	end

	def after_create(trainning)
		create_trainning(trainning, "create")
	end

	def after_destroy(trainning)
		create_trainning(trainning, "destroy")
	end

	private

	def create_trainning(trainning, action)
		RecentActivity.create!( 
			:user_id => trainning.user_id, :action => action, 
			:assoc_class => "Trainning", :assoc_id => trainning.id, 
			:description => { "date" => "#{trainning.date_trainning}" } )
	end
end
