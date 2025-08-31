Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  root 'home#index'

  get "admin", to: "admins#index"
  namespace :admin do
    root 'dashboard#index'

    resources :events
    resources :roles
    resources :projects
    resources :users
  end
end
