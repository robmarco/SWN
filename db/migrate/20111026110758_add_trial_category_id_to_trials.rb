class AddTrialCategoryIdToTrials < ActiveRecord::Migration
  def self.up
    add_column :trials, :trial_category_id, :integer
  end

  def self.down
    remove_column :trials, :trial_category_id
  end
end
