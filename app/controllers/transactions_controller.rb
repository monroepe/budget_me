class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = current_user.transactions.includes(:category).by_year(params[:year])
    @years = Transaction.years(current_user)

    respond_to do |format|
      format.html
      format.json { render json: { data: @transactions.map{ |t| [t.name, t.amount, t.category.name, t.description, t.date] } } }
    end
  end

  def show
    @budget = current_user.budget
    @transaction = current_user.transactions.find(params[:id])
    @budget_items = @budget.budget_items.where(category_id: @transaction.category_id)
    @transactions = current_user.transactions.where(category_id: @transaction.category_id)
    gon.category = @transaction.category.name
    gon.transactions = @transactions.get_transactions
    gon.budget = @budget.budget_amount(@transaction.category_id)
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

    redirect_to user_transactions_path(current_user), notice: "Transaction deleted successfully!"
  end

  private

  def transaction_params
    params.require(:transaction).permit(:date, :name, :amount, :category_id, :description, :type)
  end
end
