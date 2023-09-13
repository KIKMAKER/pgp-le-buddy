Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } #omniauth call back controller for github login
  root to: "pages#home"

  get "/terms", to: "pages#terms"
  get "/privacy", to: "pages#privacy"
  get "/team", to: "pages#team"
  get "/dashboard", to: "pages#dashboard"
  get "/edit_profile", to: "profiles#edit_profile"
  resources :challenges, only: %i[index]
  resources :app_feedbacks
  resources :buddy_ups, only: %i[index show]
  resources :profiles, only: %i[index show new create update]
  resources :social_links, only: :create
  resources :requests
  resources :profile_languages, only: %i[create destroy]
end
