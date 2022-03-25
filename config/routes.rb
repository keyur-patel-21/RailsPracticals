Rails.application.routes.draw do
  root "pages#home"
  get "pages/about"

  resources :books
  resources :authors

  resources :students
  resources :faculties
  
  get "employees/search"
  get 'employees/results'
  resources :employees
  
end
