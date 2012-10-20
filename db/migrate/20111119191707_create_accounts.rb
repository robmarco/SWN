class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :secname
      t.string :dni
      t.string :club
      t.string :web
      t.string :phone
      t.string :address
      t.string :city
      t.string :country
      t.integer :postal
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
