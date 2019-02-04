Rails.application.routes.draw do
  # Routes for users
  #root 'posts#index' 
  get 'users/new' => 'users#new', as: 'register_page'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]
  
  #Routes for blog posts
  root 'posts#index' 
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
