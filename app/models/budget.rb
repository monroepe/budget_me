class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :budget_items, dependent: :destroy

  validates :name, :user_id, presence: true

  def expenses
    expenses = 0
    self.budget_items.each do |budget_item|
      if budget_item.expense?
        expenses += budget_item.amount
      end
    end

    expenses
  end

  def income
    income = 0
    self.budget_items.each do |budget_item|
      if !budget_item.expense?
        income += budget_item.amount
      end
    end

    income
  end
end
