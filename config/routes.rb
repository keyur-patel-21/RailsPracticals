Rails.application.routes.draw do
  root "pages#home"
  get "pages/about"
  get "pages/advance_query_interface"

  resources :books
  resources :authors

  resources :students
  resources :faculties
  
  # Active record Query Interface Routes
  get 'search', to:"employees#search"
  get 'employees/results'
  post '/increaseOrder', to: "employees#increaseOrder"
  post '/decreaseOrder', to: "employees#decreaseOrder"
  resources :employees

  # Advance Active Record Query Interface Routes
  get "products/activeTrue"
  resources :products
  resources :customers
  resources :orders

  # Active Record Association
  resources :events
  get "signup", to: "users#new"
  resources :users, except: [:new]
end
