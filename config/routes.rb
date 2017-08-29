Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/_/sidekiq'

  resources :stories, only: [] do
    collection do
      get :top
      get :best
      get :publish_one
    end
    member do
      get :preview
      post :publish
    end
  end
  namespace :hacker_news do
    resources :items, only: [] do
      collection do
        get :top
        get :best
        get :async_sync
      end
    end
  end

  concern :commentable do
    resources :comments, shallow: true
  end

  resources :users, concerns: :commentable, only: []
  devise_for :users, controllers: { omniauth_callbacks: 'authentication/omniauth_callbacks' }
  root to: 'stories#best'
  get 'pages/landing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
