# == Schema Information
#
# Table name: trainnings
#
#  id             :integer         not null, primary key
#  date_trainning :date
#  macro          :integer
#  micro          :integer
#  physical       :text
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Trainning < ActiveRecord::Base
  belongs_to :user
  has_many :trainning_exercises, :dependent => :destroy
  
  accepts_nested_attributes_for :trainning_exercises,
      # :reject_if => lambda {|attrs| attrs['repetition'].blank? || attrs['heat'].blank? || attrs['distance'].blank? || 
      #   attrs['style'].blank? || attrs['exercise_type_id'].blank?},
      :allow_destroy => true

  validates_presence_of :micro, :macro, :date_trainning
  
  # scope :last_micro, where(:micro => self.maximum("micro"))
  # scope :last_macro, where(:macro => self.maximum("macro"))
  
  def volumen
    vol=0
    self.trainning_exercises.each do |t|
     vol += t.volumen
    end
    vol
  end
  
  def carga
    carga=0
    self.trainning_exercises.each do |t|
      carga += t.carga
    end
    carga
  end

  def self.this_week
    today = Date.today
    wkBegin = Date.commercial(today.cwyear, today.cweek, 1)
    wkEnd = Date.commercial(today.cwyear, today.cweek, 7)
    self.where(:date_trainning => wkBegin..wkEnd)
  end

  # def self.find_by_date(date)
  #   self.where(:date_trainning => date)
  # end

  # def self.first_trainning(user)
  #   user.trainnings.order("date_trainning ASC").limit(1).first
  # end

  # def self.last_trainning(user)
  #   user.trainnings.order("date_trainning DESC").limit(1).first
  # end

  # def self.volumen_by_date(user, date)
  #   vol=0
  #   user.trainnings.find_by_date(date).each do |trainning|
  #     vol += trainning.volumen
  #   end
  #   vol
  # end
  
  # def self.carga_by_date(user, date)
  #   carga=0
  #   user.trainnings.find_by_date(date).each do |trainning|
  #     carga += trainning.carga
  #   end
  #   carga
  # end
end


