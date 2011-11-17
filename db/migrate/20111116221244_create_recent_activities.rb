class CreateRecentActivities < ActiveRecord::Migration
  def self.up
    create_table :recent_activities do |t|
      t.integer :user_id
      t.string :action
      t.string :assoc_class
      t.integer :assoc_id
      t.date :date_activity

      t.timestamps
    end
  end

  def self.down
    drop_table :recent_activities
  end
end
