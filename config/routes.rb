Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  get 'contact', to: 'pages#contact', as: :contact

  resources :contacts
  resources :annonces

  resources :products do
    resources :jewels
    resources :special_requests
    resources :stones
    resources :watchs
  end
end
