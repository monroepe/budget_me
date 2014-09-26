class Transaction < ActiveRecord::Base
  belongs_to :budget
  belongs_to :type

  validates :name, :amount, :budget_id, presence: true
end
