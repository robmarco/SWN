# encoding: utf-8
# == Schema Information
#
# Table name: competitions
#
#  id               :integer         not null, primary key
#  date_competition :date
#  title            :string(255)
#  place            :string(255)
#  chrono_type      :string(255)
#  pool_dist        :string(255)
#  category         :string(255)
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#


class Competition < ActiveRecord::Base  
  belongs_to :user
  has_many :competition_results, :dependent => :destroy

  accepts_nested_attributes_for :competition_results, 
    #:reject_if => lambda {|attrs| attrs['swimmer_id'].blank? || attrs['competition_set_id'].blank? || attrs['time_result'].blank? },
    :allow_destroy => true

  validates_presence_of :date_competition, :title, :place, :chrono_type, :pool_dist, :category
  
  scope :mini, where(:category => "Mini")
  scope :preb, where(:category => "PreBenjamin")
  scope :benj, where(:category => "Benjamin")
  scope :ale, where(:category => "Alevin")
  scope :inf, where(:category => "Infantil")
  scope :jun, where(:category => "Junior")
  scope :abs, where(:category => "Absoluto")
  scope :mast, where(:category => "Master")
  scope :short_pool, where(:pool_dist => "25m")
  scope :long_pool, where(:pool_dist => "50m")

  def self.this_week
    today = Date.today
    wkBegin = Date.commercial(today.cwyear, today.cweek, 1)
    wkEnd = Date.commercial(today.cwyear, today.cweek, 7)
    self.where(:date_competition => wkBegin..wkEnd)
  end
  
end
