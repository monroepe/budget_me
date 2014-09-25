class Transaction < ActiveRecord::Base
  belongs_to :budget

  validates :name, :amount, :budget_id, presence: true
end
