Rails.application.routes.draw do
  get 'game_player/create'
  resources :game_stadistics
  resources :game_items
  resources :games
  resources :players
  devise_for :users, controllers: { registrations: 'users/registrations'}
  resources :items
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
