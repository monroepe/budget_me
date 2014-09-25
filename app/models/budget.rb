class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :name, :user_id, presence: true
end
