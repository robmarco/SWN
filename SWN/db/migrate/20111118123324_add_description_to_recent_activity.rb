class AddDescriptionToRecentActivity < ActiveRecord::Migration
  def self.up
    add_column :recent_activities, :description, :string
  end

  def self.down
    remove_column :recent_activities, :description
  end
end
