Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources :users, only: [] do
    resources :transactions
  end

  resources :users, only: [] do
    resources :budgets, except: [:index]
  end

  resources :budgets, only: []do
    resources :budget_items
  end
end
