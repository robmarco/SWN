# encoding: utf-8
# == Schema Information
#
# Table name: swimmers
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  secname     :string(255)
#  born        :date
#  licence     :integer
#  email       :string(255)
#  address     :string(255)
#  postal      :integer
#  city        :string(255)
#  country     :string(255)
#  phone       :integer
#  parentname  :string(255)
#  parentemail :string(255)
#  parentphone :integer
#  disease     :text
#  observation :text
#  category    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#  state       :string(255)
#  genre       :string(255)
#


class Swimmer < ActiveRecord::Base
  before_update :add_to_recent_activity_update
  after_create :add_to_recent_activity_create
  after_destroy :add_to_recent_activity_destroy
  
  attr_reader :swimmer_name_secname, :swimmer_secname_name
  
  belongs_to :user
  has_many :competition_results, :dependent => :destroy
  has_many :trial_results, :dependent => :destroy

  validates_presence_of :name, :secname, :born, :licence, :category, :state, :genre, :email
  
  scope :female, where(:genre => "Femenino")
  scope :male, where(:genre => "Masculino")
  scope :federado, where(:state => "Federado")
  scope :no_federado, where(:state => "No Federado")
  scope :baja, where(:state => "Baja")
  
  def swimmer_name_secname
    name + ' ' + secname
  end
  
  def swimmer_secname_name
    secname + ', ' + name
  end
  
  private
  
  def add_to_recent_activity_update
    if self.changed?
      RecentActivity.create!( :user_id => self.user_id, :action => "update", :assoc_class => "Swimmer", 
        :assoc_id => self.id, :description => "Se ha modificado el nadador #{self.name} #{self.secname}")
    end
  end
  
  def add_to_recent_activity_create
    RecentActivity.create!( :user_id => self.user_id, :action => "create", :assoc_class => "Swimmer", 
      :assoc_id => self.id, :description => "Nadador #{self.name} #{self.secname} en categoría #{self.category}")
  end
  
  def add_to_recent_activity_destroy
    RecentActivity.create!( :user_id => self.user_id, :action => "destroy", :assoc_class => "Swimmer", 
      :assoc_id => self.id, :description => "Nadador #{self.name} #{self.secname} en categoría #{self.category}")
  end
  
end
