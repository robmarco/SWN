class CreateCompetitionResults < ActiveRecord::Migration
  def self.up
    create_table :competition_results do |t|
      t.integer :swimmer_id
      t.integer :competition_set_id
      t.string :time_result
      t.string :disqualify
      t.string :observation
      t.integer :competition_id

      t.timestamps
    end
  end

  def self.down
    drop_table :competition_results
  end
end
