Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "explore#index"

  # Routes for Explore page
  resources :explore

  #Routes for Posts

  resources :post do
    resources :comments, :likes
  end

  #update post
  patch 'post/:id', to: 'post#update'
  
  #new Post
  post "/post/new", to: "post#create"

  #like post
  put "/post/:id/like", to: "post#like"

  #unlike post
  put "/post/:id/unlike", to: "post#unlike"

  #delete post
  get "/post/:id/delete", to: "post#destroy"

  #apply post
  get "/post/:id/apply", to: "post#apply"

  #Upload Profile Photo
  post "/dash_board", to: "dash_board#uploadPicture"
  
  #Routes for Dashboard page
  get "/dash_board", to: "dash_board#index"

  #Route for Applications page
  get "/application", to: "application#index"

  #Routes for Settings page
  get "/settings", to: "settings#index"

  #Route for Logout
  get "/logout", to: "logout#index"

end
