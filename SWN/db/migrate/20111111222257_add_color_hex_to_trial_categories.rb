class AddColorHexToTrialCategories < ActiveRecord::Migration
  def self.up
    add_column :trial_categories, :color_hex, :string
  end

  def self.down
    remove_column :trial_categories, :color_hex
  end
end
