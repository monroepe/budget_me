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
end
