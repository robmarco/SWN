class Incident < ActiveRecord::Base
  before_update :add_to_recent_activity_update
  after_create :add_to_recent_activity_create
  after_destroy :add_to_recent_activity_destroy
   
  belongs_to :user
  
  validates_presence_of :title, :date_incident
  
  private
  
  def add_to_recent_activity_update
    if self.changed?
      RecentActivity.create!( :user_id => self.user_id, :action => "update", :assoc_class => "Incident", 
        :assoc_id => self.id, :description => "Se ha modificado #{self.title}")
    end
  end
  
  def add_to_recent_activity_create
    RecentActivity.create!( :user_id => self.user_id, :action => "create", :assoc_class => "Incident", 
      :assoc_id => self.id, :description => "#{self.title}")
  end
  
  def add_to_recent_activity_destroy
    RecentActivity.create!( :user_id => self.user_id, :action => "destroy", :assoc_class => "Incident", 
      :assoc_id => self.id, :description => "#{self.title}")
  end
  
end
