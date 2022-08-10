Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  get 'profile', action: :show, controller: 'users'
  post 'profile', action: :update, controller: 'users'
  get 'profile/edit', action: :edit, controller: 'users'
  resources :events do
    resources :attendances, only: %i[create new index]
  end
  resources :checkout, only: %i[create]
end
