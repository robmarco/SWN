class CreateSwimmers < ActiveRecord::Migration
  def self.up
    create_table :swimmers do |t|
      t.string :name
      t.string :secname
      t.date :born
      t.integer :licence
      t.string :email
      t.string :address
      t.integer :postal
      t.string :city
      t.string :country
      t.integer :phone
      t.string :parentname
      t.string :parentemail
      t.integer :parentphone
      t.text :disease
      t.text :observation
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :swimmers
  end
end
