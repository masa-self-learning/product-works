Rails.application.routes.draw do

  get 'admin_works/index'
  devise_for :admins, controllers: {
    registrations: "admins/registrations",
    sessions: "admins/sessions"
  }
  devise_for :users

  root to: "home#index"
  resources :users
  resources :works
  resources :admin_works
end
