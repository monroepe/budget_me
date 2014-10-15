class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :budget_items, dependent: :destroy

  validates :name, :user_id, presence: true

  def total(transactions, type)
    if type == "income"
      totals = transactions.where("amount > 0")
    elsif type == "expense"
      totals = transactions.where("amount < 0")
    end

    total = 0
    transactions.each do |transaction|
      total += transaction.monthly
    end

    total
  end

  def get_budget(category_id)
    if category_id
      budget = self.budget_items.where(category_id: category_id)
    else
      budget = self.budget_items.where.not(category_id: 6)
    end

    total = 0

    budget.each do |item|
      total += item.monthly.abs.to_f
    end

    total
  end

  def budget_amount(category_id)
    total = self.get_budget(category_id)

    budget = []
    12.times do
      budget << total
    end

    budget
  end

  def budget_percentage(category_id)
    budget = self.get_budget(category_id)
    total = self.total(self.budget_items, "expense")
    ((budget / total) * 100).to_f
  end

  def category_data
    categories = []

    Category.all.each do |category|
      unless category.name == "Pay"
        categories << [category.name, budget_percentage(category.id)]
      end
    end

    categories
  end
end
