class Competition < ActiveRecord::Base
  belongs_to :user
  has_many :competition_results, :dependent => :destroy
  accepts_nested_attributes_for :competition_results, 
    #:reject_if => lambda {|attrs| attrs['swimmer_id'].blank? || attrs['competition_set_id'].blank? || attrs['time_result'].blank? },
    :allow_destroy => true
  
  # scopes for competition categories --
  scope :mini, where(:category => "Mini")
  scope :preb, where(:category => "PreBenjamin")
  scope :benj, where(:category => "Benjamin")
  scope :ale, where(:category => "Alevin")
  scope :inf, where(:category => "Infantil")
  scope :jun, where(:category => "Junior")
  scope :abs, where(:category => "Absoluto")
  scope :mast, where(:category => "Master")
  # ------------------------------------
  
  validates_presence_of :date_competition, :title, :place, :chrono_type, :pool_dist, :category

end
