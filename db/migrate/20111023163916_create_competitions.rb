class CreateCompetitions < ActiveRecord::Migration
  def self.up
    create_table :competitions do |t|
      t.date :date_competition
      t.string :title
      t.string :place
      t.string :chrono_type
      t.string :pool_dist
      t.string :category
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :competitions
  end
end
