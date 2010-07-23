class AddTaglineToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :tagline, :string
  end

  def self.down
    remove_column :profiles, :tagline
  end
end
