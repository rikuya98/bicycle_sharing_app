Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles do
    collection do
    get 'search'
    resources :comments, only: [:destroy, :create]
    resource :like, only: [:show, :create, :destroy]
    end
  end

  resource :profile, only: [:show, :edit, :update]


end
