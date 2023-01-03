Rails.application.routes.draw do
  devise_for :users
  root "categories#index"
  resources :users do
    resources :categories do
      resources :transactions
    end
  end

end
