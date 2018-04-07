Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'users/index'
  get 'signup', to: 'users#new'
  get 'users/edit' 
  get 'users/show'  
  get 'home/index'

  root 'home#index'
  resources :memories
  resources :legacies do 
    resources :comments
  end
  resources :users
  resources :charges
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
