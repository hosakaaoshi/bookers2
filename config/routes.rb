Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'abo' => 'home#about'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :index, :update]
end

