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
  
  def is_disqualified?
    self.disqualify.eql?("Descalificado") ? true : false
  end
  
  # Return the best result until date in same competition set
  def best_result_until_date
    distance = self.competition.pool_dist
    best_result = CompetitionResult.joins(:competition).where(:swimmer_id => self.swimmer_id,
      :competition_set_id => self.competition_set_id).not_disqualified.where("competitions.pool_dist = ?", 
      distance).where("competitions.date_competition <= ?", self.competition.date_competition ).order("time_result ASC").first
  end

  # True if this result is better than others in same competition_set swam before
  def is_improved?
    (self.time_result <= self.best_result_until_date.time_result) ? true : false
  end

  def diff_with_best_result_until_date
    (self.time_in_secs - self.best_result_until_date.time_in_secs).round(2)
  end

  def time_in_secs
    time_array = self.time_result.split(":")
    min = time_array[0].to_i
    sec = time_array[1].to_i
    cent = time_array[2].to_f

    min*60 + sec + cent/100
  end

  # Refactor. Look for N+1 problem solution
  # Must be both 25/50m pool dist results. No disqualify results
  def self.best_results_by_set_id(swimmer)
    results = []
    CompetitionSet.all.each do |set|
      results << joins(:competition).where(:swimmer_id => swimmer.id, 
                      :competition_set_id => set.id).in_short_pool.not_disqualified.order("time_result ASC").first
      results << joins(:competition).where(:swimmer_id => swimmer.id, 
                      :competition_set_id => set.id).in_long_pool.not_disqualified.order("time_result ASC").first
    end
    results.compact
  end

end
