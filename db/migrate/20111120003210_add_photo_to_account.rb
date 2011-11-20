class AddPhotoToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :photo, :string
  end

  def self.down
    remove_column :accounts, :photo
  end
end
