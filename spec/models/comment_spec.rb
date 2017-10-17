require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes," do
      it "is invalid without content" do
        Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        comment = Comment.new(job_id: Job.last.id)
        expect(comment).to be_invalid
      end
    end


    context "valid attributes," do
      it "is valid with a description" do
        Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        comment = Comment.new(content: "This is a cool job!", job_id: Job.last.id)
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a job" do
      Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
      comment = Comment.new(content: "This is a cool job!", job_id: Job.last.id)
      expect(comment).to respond_to(:job)
    end
  end
end
