class User < ActiveRecord::Base
  has_many :subdomains, :dependent => :destroy 
    validates_uniqueness_of :subdomain
  has_one :profile
  #has_friendly_id :name
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :subdomain  

    
end
