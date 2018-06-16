Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show, :edit, :update], path: '/profile'
  resources :articles, only: [:show, :create, :new]
  resources :file_uploaders, only: [:create]
  root 'static_pages#index'
end
