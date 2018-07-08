Rails.application.routes.draw do


  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show, :edit, :update], path: '/profile'
  resources :file_uploaders, only: [:create]
  resources :articles, :except => [:index] do

  end
  resources :comments, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]
  root 'static_pages#index'
end
