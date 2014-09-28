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

end
