Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  root to: 'prototypes#index'
  resources :prototypes, only: [:index, :new, :create, :destroy ]
  resources :users, only: :show
  end
