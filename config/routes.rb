Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")


  # Welcome / Login Page

get '/', to: "home#login", as: "root"

# Github requiring user to approve access to Touch Grass
get "/auth/github/callback", to: "sessions#create"

  # Virtual Garden / Dashboard

  # Plants
  resources :plants, only: [:index, :show] do
    collection do
      get 'search'
    end
  end

  # About Us Page
  get 'about_us', to: 'about_us#index'

  # profile page
  get '/profile', to: 'users#show'

  # sign up
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/dashboard', to: "dashboard#index", as: "dashboard"
  get '/dashboard/:user_id', to: "dashboard#show", as: "dashboard_show"

  resources :users, only: [:new]

  # login
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'
end
