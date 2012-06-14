<<<<<<< HEAD
# == Schema Information
#
# Table name: competition_results
#
#  id                 :integer         not null, primary key
#  swimmer_id         :integer
#  competition_set_id :integer
#  time_result        :string(255)
#  disqualify         :string(255)
#  observation        :string(255)
#  competition_id     :integer
#  created_at         :datetime
#  updated_at         :datetime
#

=======
>>>>>>> origin/master
class CompetitionResult < ActiveRecord::Base
  belongs_to :competition
  belongs_to :competition_set
  belongs_to :swimmer
<<<<<<< HEAD

  validates_presence_of :swimmer_id, :competition_set_id, :time_result
  
  scope :disqualified, where(:disqualify => "Descalificado")
  scope :not_disqualified, where(:disqualify => "")
  scope :in_short_pool, joins(:competition) & Competition.short_pool              # Remove later
  scope :in_long_pool, joins(:competition) & Competition.long_pool                # Remove later
  
  def is_disqualified?
    self.disqualify.eql?("Descalificado") ? true : false
  end
  
  # True if this result is better than others in same competition_set swam before
  def is_improved?
    distance = self.competition.pool_dist
    best_result = CompetitionResult.joins(:competition).where(:swimmer_id => self.swimmer_id,
      :competition_set_id => self.competition_set_id).not_disqualified.where("competitions.pool_dist = ?", 
      distance).where("competitions.date_competition <= ?", self.competition.date_competition ).order("time_result ASC").first
    
    (self.time_result <= best_result.time_result) ? true : false
  end
=======
  
  validates_presence_of :swimmer_id, :competition_set_id, :time_result
  
>>>>>>> origin/master
end
