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

class CompetitionResult < ActiveRecord::Base
  belongs_to :competition
  belongs_to :competition_set
  belongs_to :swimmer

  validates_presence_of :swimmer_id, :competition_set_id, :time_result
  
  scope :disqualified, where(:disqualify => "Descalificado")
  scope :not_disqualified, where(:disqualify => "")
  scope :in_short_pool, joins(:competition) & Competition.short_pool
  scope :in_long_pool, joins(:competition) & Competition.long_pool
  scope :not_me, lambda{ |id| where("competition_results.id != ?", id) }

  def is_disqualified?
    self.disqualify.eql?("Descalificado") ? true : false
  end

  def is_best_result?
    # Return true if current result id is included in array with the best results by set_id 
    CompetitionResult.best_results_by_set_id(self.swimmer).map(&:id).include? self.id
  end
  
  def best_result_until_date
    # Return the best result until date in same competition set
    distance = self.competition.pool_dist
    best_result = CompetitionResult.joins(:competition).not_me(self.id).where(:swimmer_id => self.swimmer_id,
      :competition_set_id => self.competition_set_id).not_disqualified.where("competitions.pool_dist = ?", 
      distance).where("competitions.date_competition <= ?", self.competition.date_competition ).order("time_result ASC").limit(1).first
  end

  def is_improved?
    # True if this result is better than others in same competition_set swam before
    best_result = self.best_result_until_date
    ( (self.time_result <= best_result.time_result) ? (return true) : (return false) ) unless best_result.nil?
    true
  end

  def diff_with_best_result_until_date
    best_result = self.best_result_until_date
    return (self.time_in_secs - best_result.time_in_secs).round(2) unless best_result.nil?
    0.0
  end

  def diffpercent_with_best_result_until_date
    best_result = self.best_result_until_date
    return ( (self.time_in_secs - best_result.time_in_secs) * 100/best_result.time_in_secs).round(2) unless best_result.nil?
    0.0
  end

  def time_in_secs
    time_array = self.time_result.split(":")
    min = time_array[0].to_i
    sec = time_array[1].to_i
    cent = time_array[2].to_f

    min*60 + sec + cent/100
  end

  def self.best_results_by_set_id(swimmer)
    joins(:competition).select('competition_results.id, swimmer_id, competition_set_id, MIN(time_result) as time_result, 
      disqualify, observation, competition_id').group(:pool_dist, :competition_set_id).where(:swimmer_id => swimmer).not_disqualified.sort_by(&:competition_set_id)
  end

end
