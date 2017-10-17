require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all the companies" do
    companies = create_list(:company, 2)
        visit companies_path

    expect(page).to have_content(companies[0].name)
    expect(page).to have_content(companies[1].name)
  end

end
