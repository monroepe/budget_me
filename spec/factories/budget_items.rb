FactoryGirl.define do
  factory :transaction do
    budget
    name "Rent"
    type "Expense"
    amount 1550
    duration_id 1
    category_id 1
  end
end
