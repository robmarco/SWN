class ExerciseType < ActiveRecord::Base
  has_many :trainning_exercises
  
  validates_uniqueness_of :name
end
