class AddTypeValueToTrialCategories < ActiveRecord::Migration
  def self.up
    add_column :trial_categories, :type_value, :string
  end

  def self.down
    remove_column :trial_categories, :type_value
  end
end
