require "rails_helper"

feature "Create Budget Item" do
  scenario "user creates Budget Item succesfully" do
    category = FactoryGirl.create(:category)
    duration = FactoryGirl.create(:duration)
    budget = FactoryGirl.create(:budget)
    user = budget.user

    sign_in_as(user)
    visit new_budget_budget_item_path(budget)

    fill_in "Amount", with: 1600
    select(category.name, from: "Category")
    select(duration.name, from: "Duration")
    choose("Expense")
    click_on "Create Budget item"

    expect(page).to have_content "Budget item created successfully!"
  end

  scenario "user fails to create Budget Item succesfully - no amount" do
    category = FactoryGirl.create(:category)
    duration = FactoryGirl.create(:duration)
    budget = FactoryGirl.create(:budget)
    user = budget.user

    sign_in_as(user)
    visit new_budget_budget_item_path(budget)

    select(category.name, from: "Category")
    select(duration.name, from: "Duration")
    choose("Expense")
    click_on "Create Budget item"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to create Budget Item succesfully - no category" do
    category = FactoryGirl.create(:category)
    duration = FactoryGirl.create(:duration)
    budget = FactoryGirl.create(:budget)
    user = budget.user

    sign_in_as(user)
    visit new_budget_budget_item_path(budget)

    fill_in "Amount", with: 1600
    select(duration.name, from: "Duration")
    choose("Expense")
    click_on "Create Budget item"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to create Budget Item succesfully - no duration" do
    category = FactoryGirl.create(:category)
    duration = FactoryGirl.create(:duration)
    budget = FactoryGirl.create(:budget)
    user = budget.user

    sign_in_as(user)
    visit new_budget_budget_item_path(budget)

    fill_in "Amount", with: 1600
    select(category.name, from: "Category")
    choose("Expense")
    click_on "Create Budget item"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to create Budget Item succesfully - no type" do
    category = FactoryGirl.create(:category)
    duration = FactoryGirl.create(:duration)
    budget = FactoryGirl.create(:budget)
    user = budget.user

    sign_in_as(user)
    visit new_budget_budget_item_path(budget)

    fill_in "Amount", with: 1600
    select(category.name, from: "Category")
    select(duration.name, from: "Duration")
    click_on "Create Budget item"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to create Budget Item succesfully - blank" do
    category = FactoryGirl.create(:category)
    duration = FactoryGirl.create(:duration)
    budget = FactoryGirl.create(:budget)
    user = budget.user

    sign_in_as(user)
    visit new_budget_budget_item_path(budget)

    click_on "Create Budget item"

    expect(page).to have_content "can't be blank"
  end
end
