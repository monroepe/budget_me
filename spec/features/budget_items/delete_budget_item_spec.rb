require "rails_helper"

feature "Delete budget item" do
  scenario "user deletes budget item succesfully" do
    category = FactoryGirl.create(:category)
    duration = FactoryGirl.create(:duration)
    budget = FactoryGirl.create(:budget)
    budget_item = FactoryGirl.create(:budget_item, budget_id: budget.id, category_id: category.id, duration_id: duration.id)
    user = budget.user

    sign_in_as(user)
    visit budget_budget_items_path(budget)
    click_on "Delete"

    expect(page).to have_content "Budget item deleted"
  end
end
