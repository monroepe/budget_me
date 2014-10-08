class BudgetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @budget = current_user.budget
    @transactions = current_user.transactions
    @budget_items = @budget.budget_items

    @spent = spent(@transactions)
    @income = income(@transactions)
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = current_user.budgets.build(budget_params)

    if @budget.save
      redirect_to @budget, notice: 'Budget created successfully!'
    else
      render "new"
    end
  end

  def edit
    @budget = current_user.budgets.find(params[:id])
  end

  def update
    @budget = current_user.budgets.find(params[:id])

    if @budget.update(budget_params)
      redirect_to @budget, notice: 'Budget name updated successfully!'
    else
      render "edit"
    end
  end

  def destroy
    @budget = current_user.budgets.find(params[:id])

    @budget.destroy

    redirect_to budgets_path, notice: 'Budget destroyed successfully!'
  end

  private

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
