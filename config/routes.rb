Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show]

  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  get 'admin', to: 'admins#admin', as: :admin
  post 'admin_a_check/:id', to: 'admins#admin_a_check', as: :admin_a_check
  post 'admin_p_check/:id', to: 'admins#admin_p_check', as: :admin_p_check

  get 'conditions_generales', to: 'pages#conditions_generales'
  get 'mentions_legales', to: 'pages#mentions_legales'

  resources :contacts, only: [:new, :create]
  resources :annonces

  resources :jewels, only: [:index, :show]
  resources :special_requests, only: [:index, :show]
  resources :stones, only: [:index, :show]
  resources :watchs, only: [:index, :show]

  resources :products do
    resources :product_attachments, only: [:edit, :update, :destroy]
    resources :jewels, only: [ :new, :create, :edit, :update]
    resources :special_requests, only: [ :new, :create, :edit, :update]
    resources :stones, only: [ :new, :create, :edit, :update]
    resources :watchs, only: [ :new, :create, :edit, :update]
  end
end
