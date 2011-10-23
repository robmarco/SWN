class Competition < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :date_competition, :title, :place, :chrono_type, :pool_dist, :category
end
