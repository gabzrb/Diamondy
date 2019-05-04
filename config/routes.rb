Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  get 'contact', to: 'pages#contact', as: :contact

  resources :contacts
  resources :annonces

  resources :jewels, only: [:index]
  resources :special_requests, only: [:index]
  resources :stones, only: [:index]
  resources :watchs, only: [:index]

  resources :products do
    resources :jewels, only: [ :new, :create, :show, :edit, :update]
    resources :special_requests, only: [ :new, :create, :show, :edit, :update]
    resources :stones, only: [ :new, :create, :show, :edit, :update]
    resources :watchs, only: [ :new, :create, :show, :edit, :update]
  end
end
