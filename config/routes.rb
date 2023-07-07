Rails.application.routes.draw do
  devise_for :users
  
  root to: 'home#index'
  get 'home/index', to: 'home#index'

  get 'users/account', to: 'users#account'
  get 'users/profile', to: 'users#show'
  get 'users/profile/edit', to: 'users#edit'
  patch 'users/profile/update', to: 'users#update'

  resources :rooms
end
