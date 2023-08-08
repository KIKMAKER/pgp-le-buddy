Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } #omniauth call back controller for github login
  root to: "pages#home"

  resources :challenges, only: %i[index]
  resources :app_feedbacks
  resources :buddy_ups, only: %i[index]
  resources :profiles, only: %i[index show new create]
  resources :social_links, only: :create
end
