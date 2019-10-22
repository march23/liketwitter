Rails.application.routes.draw do
  devise_for :users

  resources :home, only: [:index]

  namespace :users do 
  	resources :tweets, only: [:index, :new, :create, :destroy]
  end

  get '/follow/:id', to: 'users/follows#follow', as: 'follow'
  get '/unfollow/:id', to: 'users/follows#unfollow', as: 'unfollow'

  root to: 'home#index'
end
