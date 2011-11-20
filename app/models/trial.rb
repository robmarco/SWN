# encoding: utf-8

class Trial < ActiveRecord::Base
  before_update :add_to_recent_activity_update
  after_create :add_to_recent_activity_create
  after_destroy :add_to_recent_activity_destroy
  
  belongs_to :trial_category
  belongs_to :user
  has_many :trial_results, :dependent => :destroy
  
  accepts_nested_attributes_for :trial_results, 
    # :reject_if => lambda {|attrs| attrs['swimmer_id'].blank? || attrs['trial_value'].blank? },
    :allow_destroy => true
  
  validates_presence_of :date_trial, :title, :trial_category_id
  
  private
  
  def add_to_recent_activity_update
    if self.changed?
      RecentActivity.create!( :user_id => self.user_id, :action => "update", :assoc_class => "Trial", 
        :assoc_id => self.id, :description => "Se ha modificado #{self.title} en categoría #{self.trial_category.name}")
    end
  end
  
  def add_to_recent_activity_create
    RecentActivity.create!( :user_id => self.user_id, :action => "create", :assoc_class => "Trial", 
      :assoc_id => self.id, :description => "#{self.title} en categoría #{self.trial_category.name}")
  end
  
  def add_to_recent_activity_destroy
    RecentActivity.create!( :user_id => self.user_id, :action => "destroy", :assoc_class => "Trial", 
    :assoc_id => self.id, :description => "#{self.title} en categoría #{self.trial_category.name}")
  end
end
