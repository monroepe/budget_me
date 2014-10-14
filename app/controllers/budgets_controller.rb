class BudgetsController < ApplicationController
  def show
    @budget = current_user.budget
    @transactions = current_user.transactions
    @budget_items = @budget.budget_items

    @spent = spent(@transactions)
    @income = income(@transactions)
    gon.category = "General"
    gon.transactions = get_transactions
    gon.budget = budget_amount
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.user = current_user

    if @budget.save
      redirect_to user_budget_path(current_user, @budget), notice: "Budget created successfully!"
    else
      render "new"
    end
  end

  def edit
    @budget = current_user.budget
  end

  def update
    @budget = current_user.budget

    if @budget.update(budget_params)
      redirect_to user_budget_path(current_user, @budget), notice: "Budget updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @budget = current_user.budget

    @budget.destroy

    redirect_to root_path, notice: "Budget deleted successfully!"
  end

  private

  def transactions_by_month
    transactions = {}
    (1..12).each do |month|
      transactions[month] = @transactions.where("extract(month from date) = ?", month)
    end

    transactions
  end

  def get_transactions
    totals = []
    transactions = transactions_by_month

    transactions.each do |_month, transaction|
      total = 0
      transaction.each do |amount|
        total += amount.amount.abs.to_f
      end
      totals << total
    end

    totals
  end

  def get_budget
    budget = @budget.budget_items
    total = 0

    budget.each do |item|
      total += item.monthly.abs.to_f
    end

    total
  end

  def budget_amount
    total = get_budget

    budget = []
    12.times do
      budget << total
    end

    budget
  end

  def budget_params
    params.require(:budget).permit(:name)
  end

  def spent(transactions)
    spent = 0

    transactions.each do |transaction|
      if transaction.expense?
        spent += transaction.amount
      end
    end
    spent
  end

  def income(transactions)
    income = 0

    transactions.each do |transaction|
      if !transaction.expense?
        income += transaction.amount
      end
    end
    income
  end

end
