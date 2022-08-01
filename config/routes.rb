# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comics, only: %i[index]
  resources :characters, only: %i[index]
  resources :favourite_comics, only: %i[create destroy]

  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  devise_for :users

  root to: 'comics#index'
end
