class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :name, :amount, :user_id, :category_id, :type, presence: true

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

  def self.by_month(month)
    where("extract(month from date) = ?", month)
  end
end
