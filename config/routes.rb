Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  root 'home#index'

  namespace :admin do
    root 'dashboard#index'

    resources :events
    resources :roles
    resources :projects
    resources :users
    delete "attachments/:id", to: "attachments#destroy", as: :attachment
  end
end
