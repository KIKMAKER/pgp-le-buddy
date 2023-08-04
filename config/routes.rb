Rails.application.routes.draw do
  get 'app_feedbacks/index'
  get 'app_feedbacks/new'
  get 'app_feedbacks/create'
  get 'app_feedbacks/edit'
  get 'app_feedbacks/update'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "pages#home"

  resources :challenges, only: %i[index]
  resources :app_feedbacks
end
