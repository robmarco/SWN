class CreateExerciseTypes < ActiveRecord::Migration
  def self.up
    create_table :exercise_types do |t|
      t.string :name
      t.string :description
      t.integer :mujika
      t.string :color

      t.timestamps
    end
  end

  def self.down
    drop_table :exercise_types
  end
end
