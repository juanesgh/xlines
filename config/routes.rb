Rails.application.routes.draw do
  get 'movement/move'
  get 'turns/change_turn'
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'friendships/friends_list'
  post 'friendships/create'
  post 'friendships/update'
  get 'friendships/show'
  delete 'friendships/destroy'
  get 'friendships/list'

  #devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :friendships
  resources :game_stadistics
  resources :game_items
  resources :games
  resources :players
  #devise_for :users
  resources :items
  resources :sessions, only: [:create, :destroy]
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
