class AddColorToTrialCategory < ActiveRecord::Migration
  def self.up
    add_column :trial_categories, :color, :string
  end

  def self.down
    remove_column :trial_categories, :color
  end
end
