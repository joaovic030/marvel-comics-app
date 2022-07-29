# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comics, only: %i[index show]

  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  devise_for :users

  root to: 'comics#index'
end
