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
  
end
