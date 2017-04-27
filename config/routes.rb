Rails.application.routes.draw do
  resources :hosts
  get "hosts/:id/play" => "hosts#play"
  get "hosts/:id/stop" => "hosts#stop"
  get "host/:id/statuses" => "hosts#statuses"
  resources :statuses
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#dashboard"
  get "debug", to: "pages#debug"
end
