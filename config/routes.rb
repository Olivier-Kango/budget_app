# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated do
    root to: 'products#index', as: :authenticated_user
  end

  root to: 'splash#index', as: :unauthenticated_user

  resources :products, only: %i[index show new create] do
    resources :expenses, only: [:index]
  end
  resources :expenses, only: %i[new create]
end
