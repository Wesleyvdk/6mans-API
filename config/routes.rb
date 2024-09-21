Rails.application.routes.draw do
  get "replays/create"
  get "servers/index"
  get "servers/show"
  get "servers/create"
  get "servers/update"
  get "servers/destroy"
  get "teams/index"
  get "teams/show"
  get "teams/create"
  get "teams/update"
  get "teams/add_member"
  get "teams/remove_member"
  get "scrims/index"
  get "scrims/show"
  get "scrims/create"
  get "scrims/join"
  get "queues/create"
  get "queues/destroy"
  get "queues/join"
  get "queues/leave"
  get "matches/index"
  get "matches/show"
  get "matches/scoreboard"
  get "accounts/create"
  get "accounts/update"
  get "accounts/destroy"
  get "accounts/index"
  get "users/index"
  get "users/show"
  get "users/stats"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
  # root "posts#index"

  # Users - Profiles and overall stats
  resources :users, only: [ :show, :destroy ] do
    member do
      get :stats
    end
  end

  # Accounts - Linking different platform accounts to a user
  resources :accounts, only: [ :create, :update, :destroy ]

  # Matches - Viewing match stats and details
  resources :matches, only: [ :index, :show ] do
    member do
      get :scoreboard
    end
  end

  # Queues - Users can join/leave queues
  resources :queues, only: [ :create, :destroy ] do
    collection do
      post :join
      delete :leave
    end
  end

  # Scrims - Create, find, and view scrims
  resources :scrims, only: [ :index, :show, :create ] do
    member do
      post :join
    end
  end

  # Teams - Managing teams
  resources :teams, only: [ :index, :show, :create, :update ] do
    member do
      post :add_member
      delete :remove_member
    end
  end

  # Servers - Discord server management
  resources :servers, only: [ :index, :show, :create, :update, :destroy ]

  # Replays - Upload and view replays
  resources :replays, only: [ :create ]
end
