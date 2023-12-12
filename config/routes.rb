Rails.application.routes.draw do
  get 'dashboard/index'
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tasks
  resources :categories


  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'about', to: 'home#about', as: 'about'
  root 'home#index'
end
