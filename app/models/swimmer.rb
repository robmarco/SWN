class Swimmer < ActiveRecord::Base
  belongs_to :user
  has_many :competition_results
  
  validates_presence_of :name, :secname, :born, :licence, :category, :state
end
