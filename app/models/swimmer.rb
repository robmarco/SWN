class Swimmer < ActiveRecord::Base
  belongs_to :user
  has_many :competition_results, :dependent => :destroy
  
  validates_presence_of :name, :secname, :born, :licence, :category, :state
  
  def attributes_id_name
    { 'id' => id, 'name' => name+' '+secname }
  end
end
