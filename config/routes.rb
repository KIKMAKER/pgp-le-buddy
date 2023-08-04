Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "pages#home"

  resources :challenges, only: %i[index]
  resources :buddy_ups, only: %i[index]
end
