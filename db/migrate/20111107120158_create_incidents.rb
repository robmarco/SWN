class CreateIncidents < ActiveRecord::Migration
  def self.up
    create_table :incidents do |t|
      t.date :date_incident
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :incidents
  end
end
