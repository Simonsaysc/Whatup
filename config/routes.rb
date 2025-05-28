Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
  resources :users
  resources :messages
  resources :chats
end
