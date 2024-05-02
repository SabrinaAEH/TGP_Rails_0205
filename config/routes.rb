Rails.application.routes.draw do
  # get 'cities/show'
  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/welcome/ask_name', to: 'welcome#ask_name'
  get '/home', to: 'pages#home'
  get '/team', to: 'pages#team'
  get '/contact', to: 'pages#contact'
  get '/ask_name', to: 'welcome#ask_name'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'welcome#ask_name'

  resources :gossips do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :users, only: [:show]
  resources :cities

end
