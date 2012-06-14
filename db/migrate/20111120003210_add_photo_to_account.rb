class AddPhotoToAccount < ActiveRecord::Migration
  def self.up
<<<<<<< HEAD
    change_table :accounts do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :accounts, :photo
=======
    add_column :accounts, :photo, :string
  end

  def self.down
    remove_column :accounts, :photo
>>>>>>> origin/master
  end
end
