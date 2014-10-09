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

  def weekly
    weekly = 0

    if self.duration.name == "daily"
      weekly = (self.amount * 7)
    elsif self.duration.name == "monthly"
      weekly = (self.amount / 4.2857)
    else
      weekly = self.amount
    end

    weekly
  end

  def daily
    daily = 0

    if self.duration.name == "weekly"
      daily = (self.amount / 7)
    elsif self.duration.name == "monthly"
      daily = (self.amount / 30)
    else
      daily = self.amount
    end

    daily
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
