class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  belongs_to :category

  validates :name, :amount, :budget_id, presence: true

  def expense?
    self.amount < 0
  end
end
