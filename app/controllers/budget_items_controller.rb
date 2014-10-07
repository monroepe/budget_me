class BudgetItemsController < ApplicationController
  def new
    @budget = current_user.budgets.find(params[:budget_id])
    @budget_item = BudgetItem.new
  end

  def create
    @budget = current_user.budgets.find(params[:budget_id])
    @budget_item = @budget.budget_items.build(budget_item_params)

    if @budget_item.save
      redirect_to @budget, notice: "Budget item created successfully!"
    else
      render "new"
    end
  end

  def edit
    @budget = current_user.budgets.find(params[:budget_id])
    @budget_item = @budget.budget_items.find(params[:id])
  end

  def update
    @budget = current_user.budgets.find(params[:budget_id])
    @budget_item = @budget.budget_items.find(params[:id])

    if @budget_item.update(budget_item_params)
      redirect_to @budget, notice: "Budget item updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @budget = current_user.budgets.find(params[:budget_id])
    @budget_item = @budget.budget_items.find(params[:id])

    @budget_item.destroy

    redirect_to budget_path(@budget), notice: "Budget item deleted"
  end

  private

  def budget_item_params
    params.require(:budget_item).permit(:date, :amount, :category_id, :description)
  end
end
