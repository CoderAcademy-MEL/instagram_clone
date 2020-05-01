Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    collection do
      get 'search'
    end
  end

  resources :dashboard, only: [:index]

  root to: 'posts#index'
end
