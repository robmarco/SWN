# == Schema Information
#
# Table name: competition_results
#
#  id                 :integer         not null, primary key
#  swimmer_id         :integer
#  competition_set_id :integer
#  time_result        :string(255)
#  disqualify         :string(255)
#  observation        :string(255)
#  competition_id     :integer
#  created_at         :datetime
#  updated_at         :datetime
#

require 'test_helper'

class CompetitionResultTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
