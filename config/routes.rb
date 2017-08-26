Rails.application.routes.draw do
  namespace :hacker_news do
    get 'items/index'
    get 'items/show'
  end

  concern :commentable do
    resources :comments, shallow: true
  end

  resources :users, concerns: :commentable, only: []
  devise_for :users, controllers: { omniauth_callbacks: 'authentication/omniauth_callbacks' }
  root to: 'pages#landing'
  get 'pages/landing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
