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

  resources :challenges, except: %i[edit new destroy]
  resources :app_feedbacks, except: %i[destroy]
  resources :buddy_ups, only: %i[index show]
  resources :profiles, only: %i[index show new create update]
  resources :social_links, only: :create
  resources :requests
  resources :profile_languages, only: %i[create destroy]

  # --------------- Admin dashboard ---------------
  get "/admin", to: "pages#admin"

  # navbar
  get "/admin/users", to: "users#admin_index"
  get "/admin/bups", to: "buddy_ups#admin_index", as: "admin_bups_index"
  get "/admin/challenges", to: "challenges#admin_index"
  get "/admin/app_feedbacks", to: "app_feedbacks#admin_index"

  # Users
  get "/admin/users/:id", to: "users#admin_show", as: "admin_user_show"
  get "/admin/set_away/:id", to: "users#admin_set_away", as: "set_away"
  get "/admin/set_active/:id", to: "users#admin_set_active", as: "set_active"
  get "/admin/set_dummy/:id", to: "users#admin_set_dummy", as: "set_dummy"
  get "/admin/toggle_admin/:id", to: "users#admin_toggle_admin", as: "toggle_admin"

  # BuddyUps
  get "/admin/bups/:id", to: "buddy_ups#admin_show", as: "admin_bup_show"
  get "/admin/bups/user/:id", to: "buddy_ups#admin_bups_user", as: "admin_bups_user"
  get "admin/bups/active/:id", to: "buddy_ups#admin_set_status_active", as: "admin_bup_set_active"
  get "admin/bups/archived/:id", to: "buddy_ups#admin_set_status_archived", as: "admin_bup_set_archived"
  get "admin/bups/complete/:id", to: "buddy_ups#admin_set_status_complete", as: "admin_bup_set_complete"
  delete "/admin/buddy_ups/:id", to: "buddy_ups#admin_delete", as: "admin_bup_delete"
  delete "/admin/requests/:id", to: "requests#admin_delete", as: "admin_request_delete"
  delete "/admin/favourites/:id", to: "favourites#admin_delete", as: "admin_favourite_delete"

  # Challenges
  get "/admin/challenges/:id/edit", to: "challenges#admin_edit", as: "admin_edit_challenge"

  # App Feedbacks
  get "/admin/app_feedbacks/:id", to: "app_feedbacks#admin_show", as: "admin_app_feedback"

  # ------------- end admin dashboard -------------
end
