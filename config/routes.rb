# frozen_string_literal: true

Rails.application.routes.draw do
  resources :incomes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated do
    root to: 'categories#index', as: :authenticated_user
  end

  root to: 'splash#index', as: :unauthenticated_user

  resources :categories, only: %i[index show new create edit update destroy] do
    resources :expenses, only: %i[index new create edit update destroy]
  end
  resources :expenses, only: %i[index show new create edit update destroy]

  # Add the route for handling the GET request for the uploaded image
  get '/uploads/:filename', to: 'uploads#show', as: :uploads
end
