Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources :users, only: [] do
    resources :transactions, except: [:show]
  end

  resources :users, only: [] do
    resources :budgets, except: [:show]
  end

  resources :budgets, only: []do
    resources :budget_items, except: [:show]
  end
end
