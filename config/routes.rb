Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts

  get 'users/:id/my_posts', to: 'post#my_posts', as: 'my_posts'
end
