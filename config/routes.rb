Rails.application.routes.draw do
  get 'snow/index'
  get 'maps' => "maps#index"
  root 'home#top'
  get 'home/about', as: "about"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users do
    member do
      get "following_index"
      get "follower_index"
    end
  end
  resources :books do
    resources :book_comments, only: [:edit, :create, :update, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :tag_contents
  resources :tags
end
