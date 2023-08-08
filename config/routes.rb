Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "pages#home"

  resources :challenges, only: %i[index]
  resources :app_feedbacks
  resources :buddy_ups, only: %i[index]
  resources :social_links, only: :create
end
