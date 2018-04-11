Rails.application.routes.draw do

  get 'help', to: 'instructions#index'
  get 'help/legacies', to: 'instructions#legacies'
  get 'help/memories', to: 'instructions#memories'
  get 'help/accounts', to: 'instructions#accounts'
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

  root 'legacies#index'
  resources :memories
  resources :legacies do 
    resources :comments
  end
  resources :users
  resources :charges
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :instructions
end
