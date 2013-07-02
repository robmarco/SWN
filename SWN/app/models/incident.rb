# == Schema Information
#
# Table name: incidents
#
#  id            :integer         not null, primary key
#  date_incident :date
#  title         :string(255)
#  description   :text
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Incident < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :date_incident
  acts_as_taggable_on :tags
end
