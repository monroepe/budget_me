require "rails_helper"

feature "Edit budget" do
  scenario "user edit budget succesfully" do
    budget = FactoryGirl.create(:budget)
    sign_in_as(budget.user)

    visit edit_user_budget_path(budget.user, budget)

    fill_in "Name", with: "Super Budget"
    click_on "Update Budget"

    expect(page).to have_content "Budget updated successfully!"
  end

  scenario "user fails to edit budget succesfully - no name" do
    budget = FactoryGirl.create(:budget)
    sign_in_as(budget.user)

    visit edit_user_budget_path(budget.user, budget)

    fill_in "Name", with: ""
    click_on "Update Budget"

    expect(page).to have_content "can't be blank"
  end
end
