class AddPhotoToAccount < ActiveRecord::Migration
  def self.up
    change_table :accounts do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :accounts, :photo
  end
end
