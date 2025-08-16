Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions"}
  get "admin", to: "admins#index"
  namespace :admins do
    resources :events
    resources :roles
    resources :projects

    get "users", to: "users#index"
    get "new_user", to: "users#new"
    post "create_user", to: "users#create"
    get "edit_user/:id", to: "users#edit", as: "edit_user"
    patch "update_user/:id", to: "users#update", as: "update_user"
    get "destroy_user/:id", to: "users#destroy", as: "destroy_user"
  end
  root 'main#index'
end
