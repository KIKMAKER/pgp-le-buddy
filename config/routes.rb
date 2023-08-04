Rails.application.routes.draw do
  get 'buddy_ups/index'
  devise_for :users
  root to: "pages#home"

  resources :challenges, only: %i[index]
  resources :buddy_ups, only: %i[index]
end
