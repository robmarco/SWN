<<<<<<< HEAD
# == Schema Information
#
# Table name: recent_activities
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  action      :string(255)
#  assoc_class :string(255)
#  assoc_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  description :string(255)
#

=======
>>>>>>> origin/master
require 'test_helper'

class RecentActivityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
