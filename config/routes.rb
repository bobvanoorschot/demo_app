# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'pages#home'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact', as: :contact

  namespace :admin do
    resources :blogs do
      member do
        get :toggle_status, as: 'toggle'
      end
    end
  end

  namespace :frontend do
    resources :blogs, only: %i[index show] do
      member do
        post :comment, as: 'comment'
      end
    end
  end

  resources :portfolios

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
