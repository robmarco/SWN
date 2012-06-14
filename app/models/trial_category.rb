# == Schema Information
#
# Table name: trial_categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  type_value  :string(255)
#  color       :string(255)
#  color_hex   :string(255)
#

class TrialCategory < ActiveRecord::Base
  has_many :trials
  
  validates_uniqueness_of :name
end
