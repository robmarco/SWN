class CreateCompetitionSets < ActiveRecord::Migration
  def self.up
    create_table :competition_sets do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :competition_sets
  end
end
