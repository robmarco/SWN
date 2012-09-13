class AddPhotoToSwimmers < ActiveRecord::Migration
  def self.up
    add_attachment :swimmers, :photo
  end

  def self.down
    remove_attachment :swimmers, :photo
  end
end
