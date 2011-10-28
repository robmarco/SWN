class TrialCategory < ActiveRecord::Base
  has_many :trials
  
  validates_uniqueness_of :name
end
