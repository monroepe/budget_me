class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :name, :amount, :user_id, presence: true

  def expense?
    self.amount < 0
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
