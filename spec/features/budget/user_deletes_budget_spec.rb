require "rails_helper"

feature "Delete budget" do
  scenario "user deletes budget succesfully" do
    budget = FactoryGirl.create(:budget)
    sign_in_as(budget.user)

    visit user_budget_path(budget.user, budget)
    first(:link, "Delete Budget").click

    expect(page).to have_content "Budget deleted successfully!"
  end
end
