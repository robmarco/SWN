class TrialResult < ActiveRecord::Base
  belongs_to :trial
  belongs_to :swimmer
  
  validates_presence_of :swimmer_id, :trial_value
  
end
