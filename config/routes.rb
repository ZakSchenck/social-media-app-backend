Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :comments, except: [:edit, :update]
  resources :users, only: [:create, :show, :update, :destroy, :index]
  resources :likes, only: [:create, :destroy]

  get "/login", to: "users#login"
  get "/logout", to: "users#logout"
  get "/user-comments", to: "comments#user_comments"
end