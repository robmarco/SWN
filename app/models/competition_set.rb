class CompetitionSet < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :competition_results
end
