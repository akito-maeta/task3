Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :home, only: [:index, :show, :about]

  resources :books

  resources :users, only: [:show, :edit, :update, :index]


end
