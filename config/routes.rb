ProductTwit::Application.routes.draw do |map|
  devise_for :users, :path_names => { :sign_up => "register" }
  devise_for :admins 
  resources :profiles
  resources :acts

   
  #match '/' => 'acts#show', :constraints => { :subdomain => /.+/ }
  root :to => "acts#index" 
end
