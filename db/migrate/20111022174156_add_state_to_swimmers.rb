class AddStateToSwimmers < ActiveRecord::Migration
  def self.up
    add_column :swimmers, :state, :string
  end

  def self.down
    remove_column :swimmers, :state
  end
end
