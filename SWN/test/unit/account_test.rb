# == Schema Information
#
# Table name: accounts
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  secname            :string(255)
#  dni                :string(255)
#  club               :string(255)
#  web                :string(255)
#  phone              :integer
#  address            :string(255)
#  city               :string(255)
#  country            :string(255)
#  postal             :integer
#  user_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
