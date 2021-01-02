Rails.application.routes.draw do
  get 'sessions/new'
  resources :posting_pages
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
