class Profile < ActiveRecord::Base   
belongs_to :user
  attr_accessible :business_name, :address, :city, :state, :zip, :email, :user_id, :tagline, :phone   
 validates_uniqueness_of :slug, :on => :create, :message => "must be unique"
end
