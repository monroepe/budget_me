require "rails_helper"

feature "Edit transaction" do
  scenario "user updates transaction succesfully" do
    budget = FactoryGirl.create(:budget)
    category = FactoryGirl.create(:category)
    user = budget.user
    transaction = FactoryGirl.create(:transaction, user_id: user.id)

    sign_in_as(user)
    visit edit_user_transaction_path(user, transaction)

    fill_in "Name", with: "New car"
    fill_in "Amount", with: 17600
    select(category.name, from: "Category")
    choose("Expense")
    click_on "Update Transaction"

    expect(page).to have_content "Transaction updated successfully!"
  end

  scenario "user fails to update transaction - no name" do
    budget = FactoryGirl.create(:budget)
    category = FactoryGirl.create(:category)
    user = budget.user
    transaction = FactoryGirl.create(:transaction, user_id: user.id)

    sign_in_as(user)
    visit edit_user_transaction_path(user, transaction)

    fill_in "Name", with: ""
    fill_in "Amount", with: 17600
    select(category.name, from: "Category")
    choose("Expense")
    click_on "Update Transaction"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to update transaction succesfully - no amount" do
    budget = FactoryGirl.create(:budget)
    category = FactoryGirl.create(:category)
    user = budget.user
    transaction = FactoryGirl.create(:transaction, user_id: user.id)

    sign_in_as(user)
    visit edit_user_transaction_path(user, transaction)

    fill_in "Name", with: "New car"
    fill_in "Amount", with: ""
    select(category.name, from: "Category")
    choose("Expense")
    click_on "Update Transaction"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to update transaction succesfully - no type" do
    budget = FactoryGirl.create(:budget)
    category = FactoryGirl.create(:category)
    user = budget.user
    transaction = FactoryGirl.create(:transaction, user_id: user.id)

    sign_in_as(user)
    visit edit_user_transaction_path(user, transaction)

    fill_in "Name", with: "New car"
    fill_in "Amount", with: 17600
    select(category.name, from: "Category")
    click_on "Update Transaction"

    expect(page).to have_content "can't be blank"
  end

  scenario "user fails to update transaction succesfully - blank" do
    budget = FactoryGirl.create(:budget)
    category = FactoryGirl.create(:category)
    user = budget.user
    transaction = FactoryGirl.create(:transaction, user_id: user.id)

    sign_in_as(user)
    visit edit_user_transaction_path(user, transaction)

    select(category.name, from: "Category")
    click_on "Update Transaction"

    expect(page).to have_content "can't be blank"
  end
end
