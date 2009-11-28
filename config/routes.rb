ActionController::Routing::Routes.draw do |map|
  map.resources :notes

  map.resources :statuses

  map.home '/', :controller => :work_orders, :action => :new
  map.thank_you '/thank_you', :controller => :work_orders, :action => :thank_you
  
  map.resources :work_orders

  map.resources :buildings

  
  # Authentication (Log in / out)
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  
  map.resources :users
  map.resource :session
end
