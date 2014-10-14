class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :name, :date, :amount, :user_id, :category_id, :type, presence: true

  attr_accessor :type

  before_save do
    if type == "Expense"
      self.amount = -(self.amount) if self.amount > 0
    else
      self.amount = -(self.amount) if self.amount < 0
    end
  end


  def expense?
    self.amount < 0
  end

  def monthly
   self.amount
  end

  def self.by_month(month)
    where("extract(month from date) = ?", month)
  end

  def self.totals_by_month
    transactions = {}
    (1..12).each do |month|
      transactions[month] = self.by_month(month)
    end

    transactions
  end

  def self.get_transactions
    totals = []
    transactions = self.totals_by_month

    transactions.each do |_month, transaction|
      total = 0
      transaction.each do |amount|
        total += amount.amount.abs.to_f
      end
      totals << total
    end

    totals
  end
end
