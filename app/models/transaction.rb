class Transaction < ActiveRecord::Base
  belongs_to :budget
  belongs_to :category
  belongs_to :type

  validates :name, :amount, :budget_id, presence: true

  def expense?
    self.amount < 0
  end
end
