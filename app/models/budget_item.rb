class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  belongs_to :category
  belongs_to :duration

  validates :amount, :category_id, :budget_id, :duration_id, :type, presence: true

  def expense?
    self.amount < 0
  end

  def monthly
    if self.duration.name == "daily"
      self.amount *= 30
    elsif self.duration.name == "weekly"
      self.amount *= 4.285
    end
  end

  attr_accessor :type

  before_save do
    if type == "Expense"
      self.amount = -(self.amount) if self.amount > 0
    else
      self.amount = -(self.amount) if self.amount < 0
    end
  end
end
