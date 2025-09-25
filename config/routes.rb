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

  root "servers#index"
end
