require 'rails_helper'

describe "User sees one comment," do
  scenario "a user sees a comment" do
    company = create(:company)
    job = create(:job)
    comment = Comment.create(content: "Notes Here!", job_id: Job.last.id)

    visit company_job_path(company, job)

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}") #company_job_path
    expect(page).to have_text(/notes here/i) #give it directions of where on the page to look
    expect(Comment.count).to eq(1)
  end
end
