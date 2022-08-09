Rails.application.routes.draw do
  root 'events#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  get 'profile', action: :show, controller: 'users'
  get 'profile/edit', action: :edit, controller: 'users'
end
