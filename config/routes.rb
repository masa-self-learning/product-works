Rails.application.routes.draw do

  devise_for :admins, controllers: {
    registrations: "admins/registrations",
    sessions: "admins/sessions"
  }
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  root to: "home#index"
  resources :users, only: [:index, :edit]
  resources :works, only: [:index, :edit]
  resources :admin_users, only: [:index]
  resources :admin_works, only: [:index, :edit]

end
