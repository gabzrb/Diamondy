Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  get 'contact', to: 'pages#contact', as: :contact

  resources :contacts
  resources :annonces

  resources :jewels, only: [:index, :show]
  resources :special_requests, only: [:index, :show]
  resources :stones, only: [:index, :show]
  resources :watchs, only: [:index, :show]

  resources :products do
    resources :jewels, only: [ :new, :create, :edit, :update]
    resources :special_requests, only: [ :new, :create, :edit, :update]
    resources :stones, only: [ :new, :create, :edit, :update]
    resources :watchs, only: [ :new, :create, :edit, :update]
  end
end
