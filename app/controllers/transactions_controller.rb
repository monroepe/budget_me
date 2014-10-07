class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all.page(params[:page])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)

    if @transaction.save
      redirect_to user_transactions_path(current_user), notice: "Transaction created successfully!"
    else
      render "new"
    end
  end

  def edit
    @transaction = current_user.transactions.find(params[:id])
  end

  def update
    @transaction = current_user.transactions.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to user_transactions_path(current_user), notice: "Transaction updated successfully!"
    else
      render "edit"
    end
  end

  def destroy
    @transaction = current_user.transactions.find(params[:id])

    @transaction.destroy

    redirect_to user_transactions_path(current_user), notice: "Transaction item deleted"
  end

  private

  def transaction_params
    params.require(:transaction).permit(:date, :name, :amount, :category_id, :description)
  end
end
