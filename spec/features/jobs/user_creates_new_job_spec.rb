require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    category = create(:category)
    company = create(:company)
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    fill_in "category[description]", with: category.description

    click_button "Create"

    expect(current_path).to eq("/jobs/#{Job.last.id}")
    expect(page).to have_content(company.name)
    expect(page).to have_content("So fun!")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
    expect(page).to have_content(category.description)

  end
end
