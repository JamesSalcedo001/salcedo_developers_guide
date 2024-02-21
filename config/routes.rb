Rails.application.routes.draw do
  
  namespace :api do
    resources :categories, only: [:index, :show, :create, :update, :destroy]
    resources :posts
    resources :users, only: [:show, :edit, :update]

    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    post "/signup", to: "users#create"
    get "/me", to: "users#me"
  
  end
  
 
  get '*path',
      to: 'fallback#index',
      constraints: ->(req) { !req.xhr? && req.format.html? }
end