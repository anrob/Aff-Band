class ApplicationController < ActionController::Base    
include UrlHelper
  protect_from_forgery
  layout 'application'  
  config.filter_parameters :password, :password_confirmation    
  
end
