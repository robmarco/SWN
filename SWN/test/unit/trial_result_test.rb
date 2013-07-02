# == Schema Information
#
# Table name: trial_results
#
#  id          :integer         not null, primary key
#  swimmer_id  :integer
#  trial_value :string(255)
#  observation :string(255)
#  trial_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class TrialResultTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
