Rails.application.routes.draw do
  # ===========================================================
  # 🧍‍♂️ Authentifizierung (Devise)
  # ===========================================================
  # Diese Zeile MUSS über allen anderen User-Routen stehen,
  # damit /users/sign_in und /users/sign_out korrekt auf Devise zeigen.
  devise_for :users

  # ===========================================================
  # 🧑‍💼 Admin-Bereich
  # ===========================================================
  namespace :admin do
    resources :users   # /admin/users, /admin/users/:id usw.
  end

  # ===========================================================
  # 🖥️ Server-Routen
  # ===========================================================
  resources :servers do
    collection do
      get :search     # /servers/search
    end
  end

  # ===========================================================
  # 🌐 Gateways
  # ===========================================================
  resources :gateways, only: %i[index show new create edit update destroy] do
    member do
      patch :reassign # /gateways/:id/reassign
    end
    collection do
      get :search     # /gateways/search
    end
  end

  # ===========================================================
  # 🎮 Mini-Game (Clicker)
  # ===========================================================
  resources :click_game, only: [:index] do
    collection do
      post :score         # /click_game/score
      get  :leaderboard   # /click_game/leaderboard
      patch :toggle_theme # /click_game/toggle_theme
    end
  end

  # ===========================================================
  # 👥 Öffentliche Benutzerübersicht (optional)
  # ===========================================================
  # Nur behalten, wenn du wirklich /users und /users/:id Seiten anzeigen willst.
  # Wenn du sie nicht brauchst, kannst du diese Zeile gefahrlos auskommentieren.
  resources :users, only: %i[index show]

  # ===========================================================
  # 🏠 Root-Pfad
  # ===========================================================
  root "servers#index"
end
