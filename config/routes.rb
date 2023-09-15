Rails.application.routes.draw do
  get "admin", to: "admins#index"
  namespace :admins do
    resources :events
  end
  devise_for :users
  root 'main#index'
end
