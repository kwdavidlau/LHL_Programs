Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users
    get 'testing'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
