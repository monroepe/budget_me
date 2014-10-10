FactoryGirl.define do
  factory :budget_item do
    budget
    type "Expense"
    amount 1550
    duration_id 1
    category_id 1
  end
end
