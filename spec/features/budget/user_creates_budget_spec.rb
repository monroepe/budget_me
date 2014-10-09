require "rails_helper"

feature "Create budget" do
  scenario "user creates budget succesfully" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_user_budget_path(user)

    fill_in "Name", with: "My Budget"
    click_on "Create Budget"

    expect(page).to have_content "Budget created successfully!"
  end

  scenario "user fails to create budget succesfully - no name" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_user_budget_path(user)

    click_on "Create Budget"

    expect(page).to have_content "can't be blank"
  end
end
