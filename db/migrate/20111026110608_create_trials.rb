class CreateTrials < ActiveRecord::Migration
  def self.up
    create_table :trials do |t|
      t.date :date_trial
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :trials
  end
end
