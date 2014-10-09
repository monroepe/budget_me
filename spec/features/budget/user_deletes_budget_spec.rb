require "rails_helper"

feature "Delete budget" do
  scenario "user deletss budget succesfully" do
    budget = FactoryGirl.create(:budget)
    sign_in_as(budget.user)

    visit user_budgets_path(budget.user, budget)
    click_on "Delete"

    expect(page).to have_content "Budget deleted successfully!"
  end
end
