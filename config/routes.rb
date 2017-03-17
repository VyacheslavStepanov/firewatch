Rails.application.routes.draw do
  resources :hosts
  resources :statuses
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#dashboard"
  get "debug", to: "pages#debug"
end
