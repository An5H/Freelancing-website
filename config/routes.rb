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

  #route to user profile
  get "/profile/:username", to: "profile#user"

  #accept a candidate
  get "/post/:post_id/user/:user_id/accept", to: "application#accept"

  #reject a candidate
  get "/post/:post_id/user/:user_id/reject", to: "application#reject"

  #update post
  patch 'post/:id', to: 'post#update'
  
  #new Post
  post "/post/new", to: "post#create"

  #like post
  get "/post/:id/like", to: "post#like"

  #unlike post
  get "/post/:id/unlike", to: "post#unlike"

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
