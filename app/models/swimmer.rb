# encoding: utf-8
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

class Swimmer < ActiveRecord::Base
  has_many :competition_results, :dependent => :destroy
  has_many :trial_results, :dependent => :destroy
  belongs_to :user

  attr_reader :swimmer_name_secname, :swimmer_secname_name

  validates_presence_of :name, :secname, :born, :licence, :category, :state, :genre, :email
  
  ## Paperclip configuration and file attachment  
  has_attached_file :photo, :styles => { :thumb => "180x180#" },
                    :url => "/uploads/swimmers/:id/:hash.:extension",
                    :hash_secret => "MzyHiTs36IARoAbX6FR7sC7pLrkpIm4u4oafNsY1nK0q9dQkWjBIVSiUgGVlBvW"

  #validates_attachment_content_type :photo,  :content_type => ["image/jpg", "image/png", "image/gif"]
  #validates_attachment_size :photo, :in => 0..2.megabytes
  ##
  
  ## Swimmer scopes
  scope :female, where(:genre => "Femenino")
  scope :male, where(:genre => "Masculino")
  scope :federado, where(:state => "Federado")
  scope :no_federado, where(:state => "No Federado")
  scope :baja, where(:state => "Baja")
  
  def swimmer_name_secname
    name + ' ' + secname
  end
  
  def swimmer_secname_name
    secname + ', ' + name
  end

  def age
    Time.now.year - self.born.year - (self.born.change(:year => Time.now.year) > Time.now.to_date ? 1 : 0)
  end

  def disease_html_clean
    self.disease.gsub(%r{</?[^>]+?>},'')
  end

  def observation_html_clean
    self.observation.gsub(%r{</?[^>]+?>},'')
  end
  
  def self.find_by_ids(ids_string)
    array_ids = ids_string.split(',').map{|a| a.to_i}
    self.find(array_ids)
  end

  def self.swimmers_by_category
    male = Hash.new
    female = Hash.new
    Category.all.map(&:name).each {|c| male[c]=0; female[c]=0}
    self.group(:genre, :category).count.each do |key,value|
      if key[0]=="Masculino"
        male[key[1]]=-value 
      elsif key[0]=="Femenino"
        female[key[1]]=value 
      end
    end
    [male, female] 
  end
 
end
