require "rails_helper"

feature "Delete transaction" do
  scenario "user deletes transaction succesfully" do
    budget = FactoryGirl.create(:budget)
    category = FactoryGirl.create(:category)
    user = budget.user
    transaction = FactoryGirl.create(:transaction, user_id: user.id, category_id: category.id)

    sign_in_as(user)
    visit user_transactions_path(user)
    click_on "Delete"

    expect(page).to have_content "Transaction deleted successfully!"
  end
end
