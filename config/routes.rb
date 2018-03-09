Rails.application.routes.draw do
  get 'users/index'

  get 'signup', to: 'users#new'

  get 'users/edit'

  get 'users/show'

  root 'home#index'
  
  get 'home/index'

  resources :users
end
