Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboards#show'
  end

  resources :posts, only: %i[create show] do
    member do
      post 'like' => 'likes#create'
      delete 'unlike' => 'likes#destroy'
    end
  end

  root to: "home#show", as: '/home'

  resources :passwords, controller: "clearance/passwords", only: %i[create new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, only: %i[create show] do
    resource :password,
      controller: "clearance/passwords",
      only: %i[create edit update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
