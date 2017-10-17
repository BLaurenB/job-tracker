require 'rails_helper'

describe "User creates a new comment," do
  scenario "a user can create a new comment" do
    category = create(:category)
    company = create(:company)
    job = create(:job)

    visit company_job_path(company,job)

    fill_in "comment[content]", with: "Notes here!"
    click_button "Submit"

    expect(current_path).to eq("/jobs/#{job.id}") #company_job_path
    expect(page).to have_text(/notes here/i)
    expect(Comment.count).to eq(1)
  end
end
