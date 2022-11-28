Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "explore#index"

  devise_for :users

  # Routes for Explore page
  resources :explore

  #Routes for Posts
  resources :post do
    resources :comments, :likes
  end

  resources :dash_board

  #route for Search
  get "/search", to: "search#search"

  #route to user profile
  get "/profile/:username", to: "profile#show"

  #accept a candidate
  get "/post/:post_id/user/:user_id/accept", to: "application#accept"

  #reject a candidate
  get "/post/:post_id/user/:user_id/reject", to: "application#reject"

  #update post
  patch 'post/:id', to: 'post#update'

  #delete a comment
  post '/post/:id/comments/:comment_id', to: "comments#delete"
  
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
  
  #Routes for Dashboard page
  get "/dash_board", to: "dash_board#index"

  #Route for Applications page
  get "/application", to: "application#index"

  #Route for Logout
  get "/logout", to: "logout#index"

end
