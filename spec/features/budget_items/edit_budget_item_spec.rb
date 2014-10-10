require "rails_helper"

feature "Edit Budget Item" do
  scenario "user edits budget item succesfully" do
    category = FactoryGirl.create(:category)
    duration = FactoryGirl.create(:duration)
    budget = FactoryGirl.create(:budget)
    budget_item = FactoryGirl.create(:budget_item, budget_id: budget.id)
    user = budget.user

    sign_in_as(user)
    visit edit_budget_budget_item_path(budget, budget_item)

    fill_in "Amount", with: 166600
    select(category.name, from: "Category")
    select(duration.name, from: "Duration")
    choose("Expense")
    click_on "Update Budget item"

    expect(page).to have_content "Budget item updated successfully!"
  end

  scenario "user fails to edit budget item succesfully - no amount" do
    category = FactoryGirl.create(:category)
    duration = FactoryGirl.create(:duration)
    budget = FactoryGirl.create(:budget)
    budget_item = FactoryGirl.create(:budget_item, budget_id: budget.id)
    user = budget.user

    sign_in_as(user)
    visit edit_budget_budget_item_path(budget, budget_item)

    fill_in "Amount", with: ""
    select(category.name, from: "Category")
    select(duration.name, from: "Duration")
    choose("Expense")
    click_on "Update Budget item"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to edit budget item succesfully - no type" do
    category = FactoryGirl.create(:category)
    duration = FactoryGirl.create(:duration)
    budget = FactoryGirl.create(:budget)
    budget_item = FactoryGirl.create(:budget_item, budget_id: budget.id)
    user = budget.user

    sign_in_as(user)
    visit edit_budget_budget_item_path(budget, budget_item)

    fill_in "Amount", with: 166600
    select(category.name, from: "Category")
    select(duration.name, from: "Duration")
    click_on "Update Budget item"

    expect(page).to have_content "can't be blank"
  end
end
