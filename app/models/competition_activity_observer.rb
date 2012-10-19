class CompetitionActivityObserver < ActiveRecord::Observer
	observe :competition

	def before_update(competition)
		create_competition(competition, "update") if competition.changed?
	end

	def after_create(competition)
		create_competition(competition, "create")
	end

	def after_destroy(competition)
		create_competition(competition, "destroy")
	end

	private

	def create_competition(competition, action)
		RecentActivity.create!( 
			:user_id => competition.user_id, :action => action, 
			:assoc_class => "Competition", :assoc_id => competition.id, 
			:description => { "title" => "#{competition.title}", "category" => "#{competition.category}", "place" => "#{competition.place}" } )
	end
end
