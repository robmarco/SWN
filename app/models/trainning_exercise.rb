class TrainningExercise < ActiveRecord::Base
  belongs_to :trainning
  belongs_to :exercise_type
    
  def volumen
    self.repetition * self.heat * self.distance
  end
  
  def carga
    self.volumen * self.exercise_type.mujika
  end
  
end
