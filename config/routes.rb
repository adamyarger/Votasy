Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'posts#index'

  resources :users, only: [:show]
  resources :links
  resources :posts, only: [:show, :create, :new] do
  	resources :comments
  end
end
