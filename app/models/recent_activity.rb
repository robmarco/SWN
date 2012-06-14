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
class RecentActivity < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user_id, :action, :assoc_class, :assoc_id
end
