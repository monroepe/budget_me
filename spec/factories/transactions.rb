FactoryGirl.define do
  factory :transaction do
    user
    name "Rent"
    type "Expense"
    date "12/12/2014"
    amount 1550
    category_id 1
  end
end
