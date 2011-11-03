class Competition < ActiveRecord::Base
  belongs_to :user
  has_many :competition_results, :dependent => :destroy
  accepts_nested_attributes_for :competition_results, 
    :reject_if => lambda {|attrs| attrs['swimmer_id'].blank? || attrs['competition_set_id'].blank? || attrs['time_result'].blank? },
    :allow_destroy => true
  
  validates_presence_of :date_competition, :title, :place, :chrono_type, :pool_dist, :category
end
