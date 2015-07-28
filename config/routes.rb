Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'static_pages#feed'

  resources :users, only: [:show] do
  	member do
  		get :following, :followers
  	end
  end
  resources :links, only: [:show, :create, :new] do
    resources :comments, module: :links
  end
  resources :relationships, only: [:create, :destroy]
  resources :posts, only: [:show, :create, :new] do
  	resources :comments, module: :posts
  end
  get 'tags/:tag', to: 'posts#index', as: :tag
end
