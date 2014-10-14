class BudgetItemsController < ApplicationController
  def index
    @budget = current_user.budget
    @budget_items = @budget.budget_items
  end

  def show
    @budget = current_user.budget
    @budget_item = @budget.budget_items.find(params[:id])
    @transactions = current_user.transactions.where(category_id: @budget_item.category_id)
    gon.category = @budget_item.category.name
    gon.transactions = get_transactions
    gon.budget = budget_amount
  end

  def new
    @budget = current_user.budget
    @budget_item = BudgetItem.new
  end

  def create
    @budget = current_user.budget
    @budget_item = @budget.budget_items.build(budget_item_params)

    if @budget_item.save
      redirect_to budget_budget_items_path(current_user), notice: "Budget item created successfully!"
    else
      render "new"
    end
  end

  def edit
    @budget = current_user.budget
    @budget_item = @budget.budget_items.find(params[:id])
  end

  def update
    @budget = current_user.budget
    @budget_item = @budget.budget_items.find(params[:id])

    if @budget_item.update(budget_item_params)
      redirect_to budget_budget_items_path(current_user), notice: "Budget item updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @budget = current_user.budget
    @budget_item = @budget.budget_items.find(params[:id])

    @budget_item.destroy

    redirect_to budget_budget_items_path(current_user), notice: "Budget item deleted"
  end

  private

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

  def transactions_by_month
    transactions = {}
    (1..12).each do |month|
      transactions[month] = @transactions.where("extract(month from date) = ?", month)
    end

    transactions
  end

  def get_budget
    budget = @budget.budget_items.where(category_id: @budget_item.category_id)
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

  def budget_item_params
    params.require(:budget_item).permit(:date, :amount, :category_id, :duration_id, :description, :type)
  end
end
