Rails.application.routes.draw do
  #get 'sessions/new'
  #get 'sessions/create'
#get 'users/new'

match '/signin',  to: 'sessions#new',         via: 'get'
match '/signin',  to: 'sessions#create',         via: 'post'

match '/signup', to: 'users#create',          via: 'post'
match '/signup', to: 'users#new',             via: 'get'

match '/events',  to: 'events#new',         via: 'get'
match '/events',  to: 'events#create',         via: 'post'
match '/users',  to: 'events#show',         via: 'get'
#match '/index',  to: 'events#index',         via: 'get'



match '/attendance',  to: 'attendances#create',         via: 'post'
match '/attendance',  to: 'attendances#new',         via: 'get'






root 'events#index'

resources :attendances, only: [:new, :create]
resources :users, only: [:new, :create, :show]
resources :sessions, only: [:new, :create]
resources :events, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
