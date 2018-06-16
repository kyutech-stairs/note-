Rails.application.routes.draw do


  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show, :edit, :update], path: '/profile'
  resources :articles, :except => [:index] do
    resources :comments, only: [:create, :destroy]
  end

  root 'static_pages#index'
end
