Rails.application.routes.draw do
  devise_for :items
  devise_for :users
  root to: "items#index"
  get 'items', to: 'items#index'
  resources :items, only: [:new, :create, :index, :show, :edit]
end
