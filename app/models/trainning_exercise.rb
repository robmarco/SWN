class TrainningExercise < ActiveRecord::Base
  belongs_to :trainning
  belongs_to :exercise_type
  
  validates_presence_of :repetition, :heat, :distance, :style, :exercise_type_id
      
  def volumen
    self.repetition * self.heat * self.distance
  end
  
  def carga
    self.volumen * self.exercise_type.mujika
  end
  
end
