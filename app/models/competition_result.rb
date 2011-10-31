class CompetitionResult < ActiveRecord::Base
  belongs_to :competition
  belongs_to :competition_set
  belongs_to :swimmer
end
