Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } #omniauth call back controller for github login
  root to: "pages#home"

  get "/terms", to: "pages#terms"
  get "/privacy", to: "pages#privacy"
  get "/team", to: "pages#team"
  get "/dashboard", to: "pages#dashboard"
  get "/edit_profile", to: "profiles#edit_profile"
  get "/preview", to: "profiles#preview"
  get "/favourite_fav", to: "favourites#fav"
  get "/favourite_del", to: "favourites#delete"

  resources :challenges, only: %i[index]
  resources :app_feedbacks
  resources :buddy_ups, only: %i[index show]
  resources :profiles, only: %i[index show new create update]
  resources :social_links, only: :create
  resources :requests
  resources :profile_languages, only: %i[create destroy]
  
  # --------------- Admin dashboard ---------------
  get "/admin", to: "pages#admin"
  get "/admin/app_feedbacks", to: "pages#admin_app_feedbacks"
  get "/admin/users", to: "pages#admin_users"
  get "/admin/bups", to: "pages#admin_bups"
  get "/admin/challenges", to: "pages#admin_challenges"
  # ------------- end admin dashboard -------------
end
