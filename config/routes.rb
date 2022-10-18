Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "explore#index"

  # Routes for Explore page
  resources :explore

  #Routes for Dashboard page
  get "/dash_board", to: "dash_board#index"

  #Route for Applications page
  get "/application", to: "application#index"

  #Routes for Settings page
  get "/settings", to: "settings#index"

  #Route for Logout
  get "/logout", to: "logout#index"
end
