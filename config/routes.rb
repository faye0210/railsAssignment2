Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :posting_pages
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :show]
end
