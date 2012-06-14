<<<<<<< HEAD
# == Schema Information
#
# Table name: trial_results
#
#  id          :integer         not null, primary key
#  swimmer_id  :integer
#  trial_value :string(255)
#  observation :string(255)
#  trial_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

=======
>>>>>>> origin/master
class TrialResult < ActiveRecord::Base
  belongs_to :trial
  belongs_to :swimmer
  
  validates_presence_of :swimmer_id, :trial_value
  
end
