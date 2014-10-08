class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :budget_items, dependent: :destroy

  validates :name, :user_id, presence: true
end
