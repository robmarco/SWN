class CreateTrainnings < ActiveRecord::Migration
  def self.up
    create_table :trainnings do |t|
      t.date :date_trainning
      t.integer :macro
      t.integer :micro
      t.text :physical
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :trainnings
  end
end
