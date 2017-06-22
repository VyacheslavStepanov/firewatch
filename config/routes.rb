Rails.application.routes.draw do
  resources :aggregators
  resources :nodes
  resources :hosts
  get "hosts/:id/play" => "hosts#play"
  get "hosts/:id/stop" => "hosts#stop"
  get "host/:id/statuses" => "hosts#statuses"
  get "host/:id/reload_history" => "hosts#reload_history"
  get "heartbeat/:id" => "pages#heartbeat"
  get "reload_hosts" => "pages#reload_hosts"
  resources :statuses
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#dashboard"
  get "debug", to: "pages#debug"
end
