require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    category = create(:category)
    company = create(:company)
    job = create(:job)

    visit company_job_path(company, job)

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.city)
  end
end
