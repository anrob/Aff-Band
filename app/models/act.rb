class Act < ActiveRecord::Base   
belongs_to :user 
attr_accessible :name, :description, :photo, :crop_x, :crop_y, :crop_w, :crop_h
has_friendly_id :name, :use_slug => true   
has_attached_file :photo, :styles => { :frontpage => "300x100", :small => "200x200#", :large => "500x500>" }, :processor => [:cropper], :default_url => "/:class/:attachment/missing.png"
attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
after_update :reprocess_photo, :if => :cropping?
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def photo_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(photo.path(style))
  end
  
  private
  
  def reprocess_photo
    photo.reprocess!
  end
 
end
