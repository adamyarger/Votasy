Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'static_pages#feed'
  mount Soulmate::Server, :at => '/autocomplete'
  resources :relationships, only: [:create, :destroy]
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :users, only: [:show] do
  	member do
  		get :following, :followers
  	end
  end

  resources :links, only: [:show, :create, :new] do
    resources :comments, module: :links
    member do
      put 'like', to: 'links#upvote'
      put 'dislike', to: 'links#downvote'
    end
  end

  resources :posts, only: [:show, :create, :new] do
  	resources :comments, module: :posts
    member do
      put 'like', to: 'posts#upvote'
      put 'dislike', to: 'posts#downvote'
    end
  end
  
end
