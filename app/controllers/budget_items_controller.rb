class BudgetItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @budget = current_user.budget
    @budget_items = @budget.budget_items

    @expenses = -(@budget.get_budget(nil))
    @income = @budget.get_budget(6)
    @difference = @income - @expenses.abs
  end

  def show
    @budget = current_user.budget
    @budget_item = @budget.budget_items.find(params[:id])
    @transactions = current_user.transactions.where(category_id: @budget_item.category_id)
    gon.category = @budget_item.category.name
    gon.transactions = @transactions.get_transactions
    gon.budget = @budget.budget_amount(@budget_item.category_id)
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

  def budget_item_params
    params.require(:budget_item).permit(:date, :amount, :category_id, :duration_id, :description, :type)
  end
end
