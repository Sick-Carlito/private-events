# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'users/new'

  match '/signin', to: 'sessions#new', via: 'get'
  match '/signin', to: 'sessions#create', via: 'post'

  match '/signup', to: 'users#create',          via: 'post'
  match '/signup', to: 'users#new',             via: 'get'

  match '/events',  to: 'events#new', via: 'get'
  #match '/allevents',  to: 'events#show', via: 'get'
  match '/events',  to: 'events#create', via: 'post'
  match '/user', to: 'users#show', via: 'get'
  # match '/index',  to: 'events#index',         via: 'get'

  match '/attendance',  to: 'attendances#create', via: 'post'
  match '/attendance',  to: 'attendances#new', via: 'get'

  root 'events#index'

  resources :attendances, only: %i[new create]
  resources :users, only: %i[new create index show]
  resources :sessions, only: %i[new create]
  resources :events, only: %i[new create index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
