require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        company = create(:company)
        job = Job.create(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        company = create(:company)
        job = Job.create(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        company = create(:company)
        job = Job.create(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end

      it "is invalid without a Category" do
        company = create(:company)
        job = Job.create(title: "Developer", description: "Wahoo", level_of_interest: 80, city: "Denver")
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        category = create(:category)
        company = Company.create(name: "Turing")
        job = Job.create(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      category = create(:category)
      job = create(:job)
      expect(job).to respond_to(:company)
    end
  end
end
