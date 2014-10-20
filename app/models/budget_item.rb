include TransactionHelper
class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  belongs_to :category
  belongs_to :duration

  validates :amount, :category_id, :budget_id, :duration_id, :type, presence: true

  def expense?
    self.amount < 0
  end

  def monthly
    monthly = 0

    if self.duration.name == "daily"
      monthly = (self.amount * 30)
    elsif self.duration.name == "weekly"
      monthly = (self.amount * 4.2857)
    else
      monthly = self.amount
    end

    monthly
  end

  attr_accessor :type

  before_save do
    self.type_correction
  end
end
