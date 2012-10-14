# == Schema Information
#
# Table name: trainning_exercises
#
#  id               :integer         not null, primary key
#  trainning_id     :integer
#  repetition       :integer
#  heat             :integer
#  distance         :integer
#  style            :string(255)
#  exercise_type_id :integer
#  observation      :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class TrainningExercise < ActiveRecord::Base
  belongs_to :trainning
  belongs_to :exercise_type
  
  validates_presence_of  :style, :exercise_type_id
  validates :repetition, :heat, :distance, :presence => true, :numericality => true
  
  def volumen
    self.repetition * self.heat * self.distance
  end
  
  def carga
    self.volumen * self.exercise_type.mujika
  end
  
  def self.find_by_exercise_type(type)
    self.where(:exercise_type_id => type)
  end
  
end
