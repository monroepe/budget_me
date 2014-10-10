class BudgetItemsController < ApplicationController
  def index
    @budget = current_user.budget
    @budget_items = @budget.budget_items
  end

  def show
    @budget = current_user.budget
    @budget_item = @budget.budget_items.find(params[:id])
    @transactions = current_user.transactions
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
