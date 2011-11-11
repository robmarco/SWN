class AddColorHexToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :color_hex, :string
  end

  def self.down
    remove_column :categories, :color_hex
  end
end
