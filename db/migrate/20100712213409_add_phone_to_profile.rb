class AddPhoneToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :phone, :string
  end

  def self.down
    remove_column :profiles, :phone
  end
end
