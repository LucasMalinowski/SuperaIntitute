# frozen_string_literal: true

# Improved routing structure following RESTful conventions.
#
# - Uses resourceful routes for admin namespace to keep paths predictable.
# - Provides separate namespaces for admin and public sections.
# - Nested registrations under events for guest sign‑ups.
# - Additional static pages are surfaced with clear, semantic paths.

Rails.application.routes.draw do
  # Home page and informational pages
  root 'pages#home'
  get 'sobre', to: 'pages#about', as: :about
  get 'contato', to: 'pages#contact', as: :contact
  get 'acessibilidade', to: 'pages#accessibility_statement', as: :accessibility_statement
  get 'privacidade',   to: 'pages#privacy_policy',         as: :privacy_policy
  get 'cookies',       to: 'pages#cookies_policy',          as: :cookies_policy

  # Devise authentication for users. Custom controllers allow whitelisting extra params.
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # Public resources. Visitors can browse published events, projects and roles.
  resources :events, only: %i[index show]
  resources :projects, only: %i[index show]
  resources :roles, only: %i[index show]

  # Admin namespace. Admins manage content and users. Uses singular module names.
  namespace :admin do
    root 'dashboard#index'
    resources :events do
      # Nested registrations under events to represent event sign‑ups. Only admin can manage.
      resources :registrations, only: %i[index destroy], module: :events
    end
    resources :projects
    resources :roles
    resources :users
  end

  # Fallback for unknown routes: render 404
  match '*unmatched', to: 'application#route_not_found', via: :all
end