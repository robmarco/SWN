class AddGenreToSwimmer < ActiveRecord::Migration
  def self.up
    add_column :swimmers, :genre, :string
  end

  def self.down
    remove_column :swimmers, :genre
  end
end
