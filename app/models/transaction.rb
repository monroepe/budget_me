include ApplicationHelper
class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :name, :date, :amount, :user_id, :category_id, :type, presence: true

  attr_accessor :type

  before_save do
    self.type_correction
  end

  def expense?
    self.amount < 0
  end

  def monthly
   self.amount
  end

  def self.by_year(year)
    if year.nil?
      where("extract(year from date) = ?", Time.now.year)
    elsif year == "All"
      all
    else
      where("extract(year from date) = ?", year)
    end
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

  def self.years(user)
    transactions = user.transactions
    years = ["All"]

    transactions.each do |transaction|
      years << transaction.date.year if !years.include?(transaction.date.year)
    end

    years
  end
end
