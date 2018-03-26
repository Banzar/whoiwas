Rails.application.routes.draw do

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'users/index'

  get 'signup', to: 'users#new'

  get 'users/edit' 

  get 'users/show'

  root 'home#index'
  
  get 'home/index'

  resources :memories
  resources :legacies
  resources :users
  resources :charges
end
