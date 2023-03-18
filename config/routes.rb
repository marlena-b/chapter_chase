# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'books#index'
  resources :books, only: %i[show index new create]
  resources :user_books, only: %i[create destroy new update] do
    member do
      patch 'rate'
    end
  end
end
