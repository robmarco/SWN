class Swimmer < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :name, :secname, :born, :licence, :category, :state
end
