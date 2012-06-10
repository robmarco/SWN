# == Schema Information
#
# Table name: exercise_types
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  mujika      :integer
#  color       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ExerciseType < ActiveRecord::Base
  has_many :trainning_exercises
  
  validates_uniqueness_of :name
end
