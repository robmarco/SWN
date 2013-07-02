class IncidentActivityObserver < ActiveRecord::Observer
	observe :incident

	def before_update(incident)
		create_incident(incident, "update") if incident.changed?
	end

	def after_create(incident)
		create_incident(incident, "create")
	end

	def after_destroy(incident)
		create_incident(incident, "destroy")
	end

	private

	def create_incident(incident, action)
		RecentActivity.create!( 
			:user_id => incident.user_id, :action => action, 
			:assoc_class => "Incident", :assoc_id => incident.id, 
			:description => { "title" => "#{incident.title}" } )
	end
end
