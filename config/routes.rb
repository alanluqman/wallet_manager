Rails.application.routes.draw do
  devise_for :users
  root 'categories#index'
  resources :users do
    resources :categories, only: %i[index show new create destroy]
    resources :transactions, only: %i[new create destroy]
  end
end
