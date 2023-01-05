Rails.application.routes.draw do
  devise_for :users
  root 'categories#index'
  resources :users do
    resources :categories
    resources :transactions
  end
end
