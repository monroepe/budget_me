class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :name, :amount, :user_id, :type, presence: true

  def expense?
    self.amount < 0
  end

  attr_accessor :type

  before_save do
    if type == "Expense"
      self.amount = -(self.amount) if self.amount > 0
    else
      self.amount = -(self.amount) if self.amount < 0
    end
  end

  def self.search(search)
    if search
      category = Category.where("name ILIKE ?", "%#{search}%")
      where(category_id: category.id)
    else
      all
    end
  end
end
