Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    collection do
    get 'search'
    end
    resources :comments, only: [:destroy, :create]
    resource :like, only: [:show, :create, :destroy]
  end

  resources :accounts, only: [:show]

  resource :profile, only: [:show, :edit, :update]
  resources :favorites, only: [:show]

end
