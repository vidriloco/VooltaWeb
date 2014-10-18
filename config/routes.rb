HoopMan::Application.routes.draw do
  root 'welcome#index'
  
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  namespace :api do
    get '/inventory/trips' => 'trips#inventory'
    get '/inventory/light/trips' => 'trips#inventory', defaults: { publishing_mode: :lite }
    get '/inventory/staging/trips' => 'trips#inventory', defaults: { publishing_mode: :staging }
    
    get '/trips/:id' => 'trips#show'
    
    get '/inventory/images' => 'images#inventory'
    get '/inventory/trashes' => 'trashes#inventory'
  end

  get '/trips-admin' => 'admin/trips#index'
  get '/trips-admin/:id' => 'admin/trips#show', as: 'trips_admin'
  put '/trips-admin/:id' => 'admin/trips#update', as: 'trips_admin_update'
  get '/trips-admin/:id/edit' => 'admin/trips#edit', as: 'trips_admin_edit'
  
  put '/users-admin/:id' => 'admin/users#update', as: 'users_admin_update'
  put '/images-admin/:id' => 'admin/images#update', as: 'images_admin_update'

  # Routes for paths
  put '/paths-admin/:id' => 'admin/paths#update', as: 'paths_admin_update'
  post '/paths-admin' => 'admin/paths#create', as: 'paths_admin'
  delete '/paths-admin/:id' => 'admin/paths#destroy', as: 'paths_admin_delete'
  
  # Routes for path-trips
  delete '/path_trips-admin/:path_id/:trip_id' => 'admin/path_trips#destroy', as: 'path_trips_admin_delete'
  post '/path_trips-admin/:path_id/:trip_id' => 'admin/path_trips#create', as: 'path_trips_admin'
  
  # Routes for pois
  get '/pois-admin/:id' => 'admin/pois#show', as: 'pois_admin'
  put '/pois-admin/:id' => 'admin/pois#update', as: 'pois_admin_update'
  delete '/pois-admin/:id' => 'admin/pois#destroy', as: 'pois_admin_delete'
  
  # Routes for poi-trips
  delete '/poi_trips-admin/:poi_id/:trip_id' => 'admin/poi_trips#destroy', as: 'poi_trips_admin_delete'
  post '/poi_trips-admin/:poi_id/:trip_id' => 'admin/poi_trips#create', as: 'poi_trips_admin'

  # Routes for contents
  post '/contents-admin' => 'admin/contents#create', as: 'contents_admin'
  delete '/contents-admin/:id' => 'admin/contents#destroy', as: 'contents_admin_delete'
  put '/contents-admin/:id' => 'admin/contents#update', as: 'contents_admin_update'
end
