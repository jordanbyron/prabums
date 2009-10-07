ActionController::Routing::Routes.draw do |map|
  map.resources :buildings

  
  # Authentication (Log in / out)
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  
  map.resources :users
  map.resource :session
end
