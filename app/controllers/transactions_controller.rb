class TransactionsController < ApplicationController
  def new
    @budget = current_user.budgets.find(params[:budget_id])
    @transaction = Transaction.new
  end

  def create
    @budget = current_user.budgets.find(params[:budget_id])
    @transaction = @budget.transactions.build(transaction_params)

    if @transaction.save
      redirect_to @budget, notice: "Transaction created successfully!"
    else
      render "new"
    end
  end

  def edit
    @budget = current_user.budgets.find(params[:budget_id])
    @transaction = @budget.transactions.find(params[:id])
  end

  def update
    @budget = current_user.budgets.find(params[:budget_id])
    @transaction = @budget.transactions.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to @budget, notice: "Transaction updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @budget = current_user.budgets.find(params[:budget_id])
    @transaction = @budget.transactions.find(params[:id])

    @transaction.destroy

    redirect_to budget_path(@budget), notice: "Transaction item deleted"
  end

  private

  def transaction_params
    params.require(:transaction).permit(:date, :name, :amount, :category_id, :description)
  end
end
