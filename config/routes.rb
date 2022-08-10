Rails.application.routes.draw do
  get 'checkout/create'
  root 'events#index'
  devise_for :users
  resources :events
  get 'profile', action: :show, controller: 'users'
  get 'profile/edit', action: :edit, controller: 'users'
  post 'profile', action: :update, controller: 'users'
end
