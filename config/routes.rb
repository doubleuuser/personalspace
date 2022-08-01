Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users, only: [:show]

  get 'users/my_posts', to: 'users#my_posts', as: 'my_posts'
  get 'search', to: 'users#search', as: 'search'

  resources :users do
    member do
      get :follow
      get :unfollow
    end
  end
end
