# == Schema Information
#
# Table name: countries
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  iso_code   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
