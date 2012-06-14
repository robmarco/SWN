<<<<<<< HEAD
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base  
=======
class User < ActiveRecord::Base
  after_create :create_account
  
>>>>>>> origin/master
  has_one :account, :dependent => :destroy
  has_many :recent_activities, :dependent => :destroy
  has_many :swimmers, :dependent => :destroy
  has_many :trainnings, :dependent => :destroy
  has_many :competitions, :dependent => :destroy
  has_many :trials, :dependent => :destroy
  has_many :incidents, :dependent => :destroy
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
<<<<<<< HEAD
  attr_accessible :email, :password, :password_confirmation, :remember_me, :account_attributes
  
  accepts_nested_attributes_for :account

  def with_account
    self.build_account
    self
  end
  
  def name
    "#{self.account.name}"
  end
  
  def photo?
    self.account.photo?
  end
    
=======
  attr_accessible :email, :password, :password_confirmation, :remember_me

  private
  
  def create_account
    @account = build_account
    @account.save 
  end
  
>>>>>>> origin/master
end
