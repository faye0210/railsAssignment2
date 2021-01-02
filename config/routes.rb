Rails.application.routes.draw do
  resources :posting_pages
  resources :users, only: [:new, :create, :show]
end
