class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  belongs_to :category

  validates :amount, :category_id, :budget_id, :type, presence: true

  def expense?
    self.amount < 0
  end

  attr_accessor :type

  before_save do
    if type == "Expense"
      amount = -(amount) if amount > 0
    end
  end
end
