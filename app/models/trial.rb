class Trial < ActiveRecord::Base
  belongs_to :trial_category
  belongs_to :user
end
