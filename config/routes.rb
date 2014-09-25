Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

  resources :budgets do
    resources :transaction, only: [:new, :create, :edit, :update, :destroy]
  end
end
