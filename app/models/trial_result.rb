class TrialResult < ActiveRecord::Base
  
  belongs_to :trial
  belongs_to :swimmer
  
end
