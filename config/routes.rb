Rails.application.routes.draw do
  #get 'sessions/new'
  #get 'sessions/create'
#get 'users/new'

match '/signin',  to: 'sessions#new',         via: 'get'
match '/signin',  to: 'sessions#create',         via: 'post'

match '/signup', to: 'users#create',          via: 'post'
match '/signup', to: 'users#new',             via: 'get'

root 'users#index'

resources :users
resources :sessions, only: [:new, :create]
resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
