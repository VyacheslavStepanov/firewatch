Rails.application.routes.draw do
  resources :aggregators
  resources :nodes
  resources :hosts
  resources :statuses

  devise_for :users, controllers: { registrations: "users/registrations" }

  authenticated :user do
    root to: "pages#dashboard", as: :authenticated_root
    get "hosts/:id/play", to: "hosts#play"
    get "hosts/:id/stop", to: "hosts#stop"
    get "host/:id/statuses", to: "hosts#status_history"
    get "host/:id/reload_history", to: "hosts#reload_history"
    get "reload_hosts", to: "pages#reload_hosts"
    get "debug", to: "pages#debug"
  end

  get "heartbeat/:id", to: "pages#heartbeat"
  root to: "pages#home"
end
