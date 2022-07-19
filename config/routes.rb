Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users, only: [:show]

  get 'users/my_posts', to: 'posts#my_posts', as: 'my_posts'

end
