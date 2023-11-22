Rails.application.routes.draw do
  # Set up Devise
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } #omniauth call back controller for github login

  # Root path
  root to: "pages#home"

  # Static pages for users not logged in
  get "/terms", to: "pages#terms"
  get "/privacy", to: "pages#privacy"
  get "/team", to: "pages#team"

  # User-facing side of the app for logged in users
  get "/dashboard", to: "pages#dashboard"
  resources :challenges, except: %i[ edit new create destroy ]
  resources :app_feedbacks, only: %i[ new create ]
  resources :buddy_ups, only: %i[ index show ]
  resources :profiles, only: %i[ show new create edit update ]
  resources :social_links, only: :create
  resources :requests
  resources :profile_languages, only: %i[ create destroy ]
  resources :favourites, only: %i[ create destroy ]

  # Admin dashboard for users that are administrators
  namespace :admin do
    get "dashboard", controller: "dashboard", action: "index"
    resources :users, only: %i[ index show update ]
    resources :challenges, only: %i[ index edit update ]
    resources :app_feedbacks, only: %i[ index show ]
    resources :buddy_ups, only: %i[ index show update destroy ]
    resources :requests, only: %i[ destroy ]
    resources :favourites, only: %i[ destroy ]
  end

end
