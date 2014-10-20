class BudgetsController < ApplicationController
  before_action :authenticate_user!

  def show
    @budget = current_user.budget
    @transactions = current_user.transactions.by_year(params[:year])
    @budget_items = @budget.budget_items.includes(:duration)
    @years = Transaction.years(current_user)

    gon.category = "General"
    gon.transactions = @transactions.where.not(category_id: 6).get_transactions
    gon.budget = @budget.budget_amount(nil)
    gon.pie_budget = @budget.category_data
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

  def budget_params
    params.require(:budget).permit(:name)
  end
end
