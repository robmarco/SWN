class TrialActivityObserver < ActiveRecord::Observer
	observe :trial

	def before_update(trial)
		create_trial(trial, "update") if trial.changed?
	end

	def after_create(trial)
		create_trial(trial, "create")
	end

	def after_destroy(trial)
		create_trial(trial, "destroy")
	end

	private

	def create_trial(trial, action)
		RecentActivity.create!( 
			:user_id => trial.user_id, :action => action, 
			:assoc_class => "Trial", :assoc_id => trial.id, 
			:description => { "title" => "#{trial.title}", "category" => "#{trial.trial_category.name}" } )
	end
end
