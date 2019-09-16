Rails.application.routes.draw do
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
    resource :likes
  end
  resources :relationships
end
