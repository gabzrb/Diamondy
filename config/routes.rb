Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :contacts

  resources :products do
    resources :jewels
    resources :special_requests
    resources :stone
    resources :watch
  end
end
