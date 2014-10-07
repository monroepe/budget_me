class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  belongs_to :category

  validates :amount, :category_id, :budget_id, presence: true

  def expense?
    self.amount < 0
  end
end
