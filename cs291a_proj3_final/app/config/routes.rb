Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "users#index"

  get 'users', to: 'users#index'
  get 'users/show/:id', to: 'users#show'  
  get 'users/new', to: 'users#new'

  get 'users/:user_id/posts', to: 'posts#index', as: :user_post
  get 'users/:user_id/posts/:id', to: 'posts#show', as: :post
  get 'users/:user_id/posts/:id/new', to: 'posts#new', as: :new_post

  #get 'users/:user_id/posts/:id/edit', to: 'posts#edit', as: :edit_post

  get 'users/:user_id/posts/:post_id/comments/:id/new', to: 'comments#new', as: :new_comment
  get 'users/:user_id/posts/:post_id/comments', to: 'comments#new', as: :user_post_comments
  get 'users/:user_id/posts/:id', to: "posts#show", as: :test

  #delete 'users/:user_id/posts/:id', to: 'posts#destroy', as: :destroy_post

  resources :users do
    resources :posts do
      resources :comments
    end
  end


  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'
  # Defines the root path route ("/")
  # root "posts#index"
end
