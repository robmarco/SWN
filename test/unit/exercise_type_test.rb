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

require 'test_helper'

class ExerciseTypeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
