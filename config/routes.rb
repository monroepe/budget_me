Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources :users, only: [] do
    resources :transactions, except: [:show]
  end

  resources :budgets do
    resources :budget_items, only: [:new, :create, :edit, :update, :destroy]
  end
end
