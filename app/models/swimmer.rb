class Swimmer < ActiveRecord::Base
  attr_reader :swimmer_name_secname, :swimmer_secname_name
  
  belongs_to :user
  has_many :competition_results, :dependent => :destroy
  has_many :trial_results, :dependent => :destroy

  validates_presence_of :name, :secname, :born, :licence, :category, :state, :genre
  
  scope :female, where(:genre => "Femenino")
  scope :male, where(:genre => "Masculino")
  
  def swimmer_name_secname
    name + ' ' + secname
  end
  
  def swimmer_secname_name
    secname + ', ' + name
  end
  
end
