class AddLanguageToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :language, :string
  end

  def self.down
    remove_column :accounts, :language
  end
end
