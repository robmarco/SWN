class CreateTrialCategories < ActiveRecord::Migration
  def self.up
    create_table :trial_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :trial_categories
  end
end
