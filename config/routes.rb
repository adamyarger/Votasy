Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'posts#index'

  resources :users, only: [:show] do
  	member do
  		get :following, :followers
  	end
  end
  resources :links
  resources :relationships, only: [:create, :destroy]
  resources :posts, only: [:show, :create, :new] do
  	resources :comments
  end
end
