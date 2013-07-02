class CreateTrainningExercises < ActiveRecord::Migration
  def self.up
    create_table :trainning_exercises do |t|
      t.integer :trainning_id
      t.integer :repetition
      t.integer :heat
      t.integer :distance
      t.string :style
      t.integer :exercise_type_id
      t.string :observation

      t.timestamps
    end
  end

  def self.down
    drop_table :trainning_exercises
  end
end
