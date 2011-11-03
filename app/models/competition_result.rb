class CompetitionResult < ActiveRecord::Base
  belongs_to :competition
  belongs_to :competition_set
  belongs_to :swimmer
  
  validates_presence_of :swimmer_id, :competition_set_id, :time_result
  
end
