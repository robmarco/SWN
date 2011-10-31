class Trial < ActiveRecord::Base
  belongs_to :trial_category
  belongs_to :user
  
  validates_presence_of :date_trial, :title, :trial_category_id
end
