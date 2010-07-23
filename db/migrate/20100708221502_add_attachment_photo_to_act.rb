class AddAttachmentPhotoToAct < ActiveRecord::Migration
  def self.up
    add_column :acts, :photo_file_name, :string
    add_column :acts, :photo_content_type, :string
    add_column :acts, :photo_file_size, :integer
    add_column :acts, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :acts, :photo_file_name
    remove_column :acts, :photo_content_type
    remove_column :acts, :photo_file_size
    remove_column :acts, :photo_updated_at
  end
end
