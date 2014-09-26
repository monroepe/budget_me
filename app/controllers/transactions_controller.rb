class TransactionsController < ApplicationController
  def new
    @types = Type.all
    @budget = current_user.budgets.find(params[:budget_id])
    @transaction = Transaction.new
  end

  def create
    @types = Type.all
    @budget = current_user.budgets.find(params[:budget_id])
    @transaction = @budget.transactions.build(transaction_params)

    if @transaction.save
      redirect_to @budget, notice: 'Transaction created successfully!'
    else
      render "new"
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :type_id, :description)
  end
end
