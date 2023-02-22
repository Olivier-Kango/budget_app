# frozen_string_literal: true

Rails.application.routes.draw do
  resources :expenses
  resources :categories

  devise_for :users, controllers: { sessions: 'users/sessions' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'categories#index'
end
