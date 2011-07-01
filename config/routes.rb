ActionController::Routing::Routes.draw do |map|
#  map.resources :pepes
#  map.resources :alerts
#  map.resources :users

  map.root :controller => "users", :action => 'login'

  #
  # login
  #
  map.login                   'login',          :controller => 'users', :action => 'login'
  map.login_check             'login_check',    :controller => 'users', :action => 'login_check'
  map.logout                  'logout',         :controller => 'users', :action => 'logout'


  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
