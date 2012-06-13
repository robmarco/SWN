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

class Account < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :secname
  
  attr_accessible :user_id, :name, :secname, :dni, :club, :web, :phone, :address, :city, :country, :postal, :photo
  
  # User photo added to the account
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "56x56>" }
  
end
