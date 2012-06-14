<<<<<<< HEAD
# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  color      :string(255)
#  color_hex  :string(255)
#

=======
>>>>>>> origin/master
class Category < ActiveRecord::Base
  validates_uniqueness_of :name
end
