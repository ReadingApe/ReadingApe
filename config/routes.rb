Rails.application.routes.draw do
  resources :stories, only: [] do
    collection do
      get :top
      get :best
    end
  end
  namespace :hacker_news do
    resources :items, only: [] do
      collection do
        get :top
        get :best
      end
    end
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
