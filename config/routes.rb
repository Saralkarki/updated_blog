Rails.application.routes.draw do
  # Routes for users
  root 'dashboard#show' 
  get 'users/new' => 'users#new', as: 'register_page'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]
  
  #Routes for blog posts

  get 'posts/index'
  # root 'posts#index'
  post 'posts' => 'posts#create'
  get 'posts/new' => 'posts#new', as: 'new_post'
  get 'posts/failure' => 'posts#failure', as: 'failure'
  get 'posts/:id' => 'posts#show' , as: 'post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
