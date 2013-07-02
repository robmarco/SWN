# == Schema Information
#
# Table name: competition_sets
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CompetitionSet < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :competition_results
end
