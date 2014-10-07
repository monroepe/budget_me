Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

  resources :budgets do
    resources :transactions, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :budgets do
    resources :budget_items, only: [:new, :create, :edit, :update, :destroy]
  end
end
