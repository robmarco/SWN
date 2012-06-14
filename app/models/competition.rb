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
  before_update :add_to_recent_activity_update
  after_create :add_to_recent_activity_create
  after_destroy :add_to_recent_activity_destroy
  
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
  scope :short_pool, where(:pool_dist => "25m")
  scope :long_pool, where(:pool_dist => "50m")
  # ------------------------------------
  
  validates_presence_of :date_competition, :title, :place, :chrono_type, :pool_dist, :category

  private
  
  def add_to_recent_activity_update
    if self.changed?
      RecentActivity.create!( :user_id => self.user_id, :action => "update", :assoc_class => "Competition", 
        :assoc_id => self.id, :description => "Se ha modificado la competición #{self.title}")
    end
  end
  
  def add_to_recent_activity_create
    RecentActivity.create!( :user_id => self.user_id, :action => "create", :assoc_class => "Competition", 
      :assoc_id => self.id, :description => "#{self.title} en #{self.place} (#{self.category})")
  end
  
  def add_to_recent_activity_destroy
    RecentActivity.create!( :user_id => self.user_id, :action => "destroy", :assoc_class => "Competition", 
      :assoc_id => self.id, :description => "#{self.title} en #{self.place} (#{self.category})")
  end
end
