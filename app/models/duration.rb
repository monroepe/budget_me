class Duration < ActiveRecord::Base
  has_many :budget_items

  validates :name, presence: true
end
