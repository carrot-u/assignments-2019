Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  resources :users do
    resources :orders
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  constraints Clearance::Constraints::SignedIn.new do
    root to: 'users#dashboard', as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'welcome#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
