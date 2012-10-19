# encoding: utf-8
# == Schema Information
#
# Table name: trials
#
#  id                :integer         not null, primary key
#  date_trial        :date
#  title             :string(255)
#  user_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#  trial_category_id :integer
#


class Trial < ActiveRecord::Base
  belongs_to :trial_category
  belongs_to :user
  has_many :trial_results, :dependent => :destroy
  
  accepts_nested_attributes_for :trial_results, 
    # :reject_if => lambda {|attrs| attrs['swimmer_id'].blank? || attrs['trial_value'].blank? },
    :allow_destroy => true
  
  validates_presence_of :date_trial, :title, :trial_category_id

  def self.this_week
    today = Date.today
    wkBegin = Date.commercial(today.cwyear, today.cweek, 1)
    wkEnd = Date.commercial(today.cwyear, today.cweek, 7)
    self.where(:date_trial => wkBegin..wkEnd)
  end
  
end
