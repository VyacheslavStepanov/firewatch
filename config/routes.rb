Rails.application.routes.draw do
  resources :hosts
  resources :statuses
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "pages#home"
end
