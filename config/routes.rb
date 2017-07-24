Rails.application.routes.draw do
  resources :notifications
  resources :notification_types
  resources :aggregators, :nodes, :hosts, :statuses
  resources :host_monitorings, only: [:update]
  resources :node_hearbeat, only: [:update]
  resources :welcome, only: [:index]
  resources :hosts do
    get "reload_history", on: :member
    get "status_history", on: :member
  end

  devise_for :users, controllers: { registrations: "users/registrations" }

  authenticated :user do
    root to: "pages#dashboard", as: :authenticated_root
  end

  get "reload_hosts", to: "pages#reload_hosts"
  get "debug", to: "pages#debug"
  get "heartbeat/:id", to: "pages#heartbeat"

  root to: "welcome#index"
end
