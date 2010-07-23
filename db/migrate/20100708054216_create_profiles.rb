class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :business_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.references :user
      t.timestamps
    end
  end
  
  def self.down
    drop_table :profiles
  end
end
