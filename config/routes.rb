Rails.application.routes.draw do


  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show, :edit, :update], path: '/profile' do
    get :following, :followers
  end
  resources :file_uploaders, only: [:create]
  resources :articles, :except => [:index] do
    resources :purchases, only: :create
    post '/prev', to: 'purchases#prev'
    resources :comments, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy, :update]
    resources :feeds, only: [:create, :destroy]
  end
  resources :follows, only: [:create, :destroy]
  get '/search', to: 'static_pages#search'
  root 'static_pages#index'
end
