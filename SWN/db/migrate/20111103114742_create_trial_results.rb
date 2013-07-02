class CreateTrialResults < ActiveRecord::Migration
  def self.up
    create_table :trial_results do |t|
      t.integer :swimmer_id
      t.string :trial_value
      t.string :observation
      t.integer :trial_id

      t.timestamps
    end
  end

  def self.down
    drop_table :trial_results
  end
end
