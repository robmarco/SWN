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
    
  attr_accessible :user_id, :name, :secname, :dni, :club, :web, :phone, :address, :city, :country, :postal, :photo
  
  # User photo added to the account
  has_attached_file :photo, :styles => { :thumb => "56x56" },
                            :url => "/uploads/avatars/:user_id/:hash.:extension",
                            :hash_secret => "MzyHiTs36IARoAbX6FR7sC7pLrkpIm4u4oafNsY1nK0q9dQkWjBIVSiUgGVlBvW"
  
  validates_presence_of :name, :secname
  validates_attachment_content_type :photo,  :content_type => ["image/jpg", "image/png", "image/gif"]
  validates_attachment_size :photo, :in => 0..2.megabytes

  
end
