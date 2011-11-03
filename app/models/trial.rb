class Trial < ActiveRecord::Base
  
  belongs_to :trial_category
  belongs_to :user
  has_many :trial_results, :dependent => :destroy
  
  accepts_nested_attributes_for :trial_results, 
    :reject_if => lambda {|attrs| attrs['swimmer_id'].blank? || attrs['trial_value'].blank? },
    :allow_destroy => true
  
  validates_presence_of :date_trial, :title, :trial_category_id
  
end
