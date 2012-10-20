# == Schema Information
#
# Table name: swimmers
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  secname            :string(255)
#  born               :date
#  licence            :integer
#  email              :string(255)
#  address            :string(255)
#  postal             :integer
#  city               :string(255)
#  country            :string(255)
#  phone              :integer
#  parentname         :string(255)
#  parentemail        :string(255)
#  parentphone        :integer
#  disease            :text
#  observation        :text
#  category           :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  state              :string(255)
#  genre              :string(255)
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

require 'test_helper'

class SwimmerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
