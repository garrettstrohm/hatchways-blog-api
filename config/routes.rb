Rails.application.routes.draw do
  resources :posts
  get '/api/ping', to: 'pings#index'
  get '/api/posts', to: 'posts#show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
