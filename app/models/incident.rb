class Incident < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :title, :date_incident
end
