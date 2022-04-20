Rails.application.routes.draw do
  
  root "pages#home"
  # root "productns#index"
  get "pages/about"

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
  get "pages/advance_query_interface"
  resources :products
  resources :customers
  resources :orders
  get "comments/like", to: "comments#like"
  resources :comments

  # Active Record Association
  get "events/home"
  # get "comments/add_comment"

  get "users/enroll"
  get "users/unenroll"
  

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :events
  resources :users, except: [:new]
  resources :categories

  # Rails_Routing

  get "index", to: "orderns#index"
  resources :productns do
    resources :orderns 
  end  
  
  namespace :business do
    get "/:id/preview", to: "customerns#preview"
    get 'search', to:"customerns#search"
    resources :customerns, only: [:index, :new, :create, :edit, :update] do
      member do
        match "delete_customer", via:[:delete]
      end
    end
  end

  # layouts and rendering

  get 'home', to:'myuser#home'

  devise_for :myusers
  resources :myproducts
  resources :myorders
end

