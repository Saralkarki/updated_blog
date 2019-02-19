Rails.application.routes.draw do
  
  # Routes for users
  #root 'posts#index' 
  
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
   
  get 'sessions/:id' => 'sessions#show' , as: 'user_detail'

  resources :sessions, only: [:create,:show,:edit,:update]
  resources :users, only: [:new, :create]
  
  #Routes for blog posts
  root 'home#index'
  get 'posts/index' => 'posts#index' , as: 'post_home'
  post 'posts' => 'posts#create'
  get 'posts/new' => 'posts#new', as: 'new_post'
  get 'posts/:id/edit' => 'posts#edit', as: 'edit_post' 
  get 'posts/failure' => 'posts#failure', as: 'failure_post'
  delete 'posts/:id' => 'posts#destroy', as: 'destroy_post'
  #get 'posts/edit' => 'posts#edit', as: 'edit_post'
  get 'posts/:id' => 'posts#show' , as: 'post'
  patch "posts/:id" => "posts#update"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
