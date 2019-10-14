Rails.application.routes.draw do
  resources :game_stadistics
  resources :game_items
  resources :games
  resources :players
  devise_for :users
  resources :items
  resources :sessions, only: [:create, :destroy]
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
