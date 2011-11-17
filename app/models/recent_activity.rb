class RecentActivity < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user_id, :action, :assoc_class, :assoc_id, :date_activity
end
