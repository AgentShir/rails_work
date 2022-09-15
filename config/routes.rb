Rails.application.routes.draw do
  resources :genres
  resources :favorites
  root "movies#index"

  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  resources :users
  get "signup" => "users#new"
  get "signin" => "sessions#new"
  get "signout" => "sessions#destroy"

  resource :session, only: [:new, :create, :destroy]
end
