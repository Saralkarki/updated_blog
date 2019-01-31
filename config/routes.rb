Rails.application.routes.draw do
  get 'posts/index'
  root 'posts#index'
  post 'posts' => 'posts#create'
  get 'posts/new' => 'posts#new', as: 'new_post'
  get 'posts/failure' => 'posts#failure', as: 'failure'
  get 'posts/:id' => 'posts#show' , as: 'post'
  

  resources :users
  get 'users/new' => 'users#register' , as: 'register'
  get 'users/index' => 'users#index', as: 'login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
