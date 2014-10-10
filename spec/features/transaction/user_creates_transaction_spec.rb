require "rails_helper"

feature "Create transaction" do
  scenario "user creates transaction succesfully" do
    budget = FactoryGirl.create(:budget)
    user = budget.user
    category = FactoryGirl.create(:category)
    sign_in_as(user)

    visit new_user_transaction_path(user)

    fill_in "Name", with: "Rent"
    fill_in "Amount", with: 1600
    select(category.name, from: "Category")
    choose("Expense")
    click_on "Create Transaction"

    expect(page).to have_content "Transaction created successfully!"
  end

  scenario "user fails to create transaction succesfully - blank" do
    budget = FactoryGirl.create(:budget)
    user = budget.user
    category = FactoryGirl.create(:category)
    sign_in_as(user)

    visit new_user_transaction_path(user)

    click_on "Create Transaction"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to create transaction succesfully - no name" do
    budget = FactoryGirl.create(:budget)
    user = budget.user
    category = FactoryGirl.create(:category)
    sign_in_as(user)

    visit new_user_transaction_path(user)

    fill_in "Amount", with: 1600
    select(category.name, from: "Category")
    choose("Expense")
    click_on "Create Transaction"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to create transaction succesfully - no amount" do
    budget = FactoryGirl.create(:budget)
    user = budget.user
    category = FactoryGirl.create(:category)
    sign_in_as(user)

    visit new_user_transaction_path(user)

    fill_in "Name", with: "Rent"
    select(category.name, from: "Category")
    choose("Expense")
    click_on "Create Transaction"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails create transaction succesfully - no category" do
    budget = FactoryGirl.create(:budget)
    user = budget.user
    category = FactoryGirl.create(:category)
    sign_in_as(user)

    visit new_user_transaction_path(user)

    fill_in "Name", with: "Rent"
    fill_in "Amount", with: 1600
    choose("Expense")
    click_on "Create Transaction"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails create transaction succesfully - no type" do
    budget = FactoryGirl.create(:budget)
    user = budget.user
    category = FactoryGirl.create(:category)
    sign_in_as(user)

    visit new_user_transaction_path(user)

    fill_in "Name", with: "Rent"
    fill_in "Amount", with: 1600
    select(category.name, from: "Category")
    click_on "Create Transaction"

    expect(page).to have_content "can't be blank"
  end
end
