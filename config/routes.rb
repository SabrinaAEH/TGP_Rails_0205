Rails.application.routes.draw do
  
  get '/home', to: 'pages#home'
  get '/team', to: 'pages#team'
  get '/contact', to: 'pages#contact'
  get '/ask_name', to: 'welcome#ask_name'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :gossips do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :users
  resources :cities

  resources :sessions, only: [:new, :create, :destroy]

  # Defines the root path route ("/")
  root 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create' 
  get '/logout', to: 'sessions#destroy'

end
