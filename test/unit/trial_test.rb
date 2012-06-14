# == Schema Information
#
# Table name: trials
#
#  id                :integer         not null, primary key
#  date_trial        :date
#  title             :string(255)
#  user_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#  trial_category_id :integer
#

require 'test_helper'

class TrialTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
