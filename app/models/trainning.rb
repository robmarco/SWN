class Trainning < ActiveRecord::Base
  before_update :add_to_recent_activity_update
  after_create :add_to_recent_activity_create
  after_destroy :add_to_recent_activity_destroy
  
  belongs_to :user
  has_many :trainning_exercises, :dependent => :destroy
  
  accepts_nested_attributes_for :trainning_exercises,
      # :reject_if => lambda {|attrs| attrs['repetition'].blank? || attrs['heat'].blank? || attrs['distance'].blank? || 
      #   attrs['style'].blank? || attrs['exercise_type_id'].blank?},
      :allow_destroy => true

  validates_presence_of :micro, :macro, :date_trainning
  
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
  
  private
  
  def add_to_recent_activity_update
    if self.changed?
      RecentActivity.create!( :user_id => self.user_id, :action => "update", :assoc_class => "Trainning", 
        :assoc_id => self.id, :description => "Se ha modificado el entrenamiento micro #{self.micro} / macro #{self.macro}")
    end
  end
  
  def add_to_recent_activity_create
    RecentActivity.create!( :user_id => self.user_id, :action => "create", :assoc_class => "Trainning", 
      :assoc_id => self.id, :description => "Entrenamiento micro #{self.micro} / macro #{self.macro}")
  end
  
  def add_to_recent_activity_destroy
    RecentActivity.create!( :user_id => self.user_id, :action => "destroy", :assoc_class => "Trainning", 
      :assoc_id => self.id, :description => "Entrenamiento micro #{self.micro} / macro #{self.macro}")
  end
  
end
