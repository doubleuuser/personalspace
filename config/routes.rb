Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :posts

  get 'users/:id/my_posts', to: 'post#my_posts', as: 'my_posts'
=======

  get 'users/:id/my_posts', to: 'posts#my_posts', as: 'my_posts'


>>>>>>> d5c95af357500df7fc80315e72a439ba4534b31c
end
