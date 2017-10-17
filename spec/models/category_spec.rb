require 'rails_helper'

describe Category do

  describe "validations" do

    context "invalid attributes" do
      it "is invalid without a description" do
        Job.create(title: "Developer", description: "Wahoo", city: "Denver")
        category = Category.new(title: "", job_id: Job.last.id)
        expect(category).to be_invalid
      end

    end

    context "valid attributes" do
      it "is valid with a description" do
        job = Job.create(title: "Developer", description: "Wahoo", city: "Denver")
        category = Category.new(description: "Job I want", job_id: Job.last.id)
        expect(category).to be_valid
      end
    end

  end

  describe "relationships" do
    it "belongs to a job" do
      job = Job.create(title: "Developer", description: "Wahoo", city: "Denver")
      category = Category.new(description: "Job I want", job_id: Job.last.id)
      expect(category).to respond_to(:job)
    end
  end

end
