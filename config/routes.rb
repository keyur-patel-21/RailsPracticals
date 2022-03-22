Rails.application.routes.draw do
active-record-migrations
  root "pages#home"
  get "pages/about"

  resources :books
  resources :authors

  resources :students
  resources :faculties
end
