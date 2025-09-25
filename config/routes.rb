Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

  devise_for :users

  resources :servers do
    collection do
      get :search
    end
  end

  resources :gateways, only: [ :index, :show, :new, :create, :edit, :update, :destroy ] do
    member do
      patch :reassign
    end
    collection do
      get :search
    end
  end
  resources :click_game, only: [ :index ] do
    collection do
      post :score
      get :leaderboard
      patch :toggle_theme
    end
  end


  # 👉 NEU: normale User-Übersicht
  resources :users, only: [ :index, :show ]

  root "servers#index"
end
