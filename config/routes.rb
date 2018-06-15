Rails.application.routes.draw do
  get "article/write" => "article#write"

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show, :edit, :update], path: '/profile'

  root 'static_pages#index'
end
