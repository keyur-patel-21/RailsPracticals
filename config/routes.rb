Rails.application.routes.draw do
active-record-migrations
  root "pages#home"
  get "pages/about"

  resources :authors
  resources :books

  resources :products
  get 'home/index'
  get "home/about"
end
