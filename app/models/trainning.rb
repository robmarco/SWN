class Trainning < ActiveRecord::Base
  
  belongs_to :user
  has_many :trainning_exercises, :dependent => :destroy
  
  accepts_nested_attributes_for :trainning_exercises,
      :reject_if => lambda {|attrs| attrs['repetition'].blank? || attrs['heat'].blank? || attrs['distance'].blank? || 
        attrs['style'].blank? || attrs['exercise_type_id'].blank?},
      :allow_destroy => true

  validates_presence_of :micro, :macro, :date_trainning
  
  def volumen
    vol=0
    self.trainning_exercises.each do |t|
     vol += t.volumen
    end
    vol
  end
  
  def carga
    carga=0
    self.trainning_exercises.each do |t|
      carga += t.carga
    end
    carga
  end
  
end
