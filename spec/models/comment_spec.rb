require 'rails_helper'

describe Comment do
  describe "validations" do

    context "invalid attributes" do
      it "is invalid without content" do
        comment = Comment.create()
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content" do
        comment = create(:comment)
        expect(comment).to be_valid
      end
    end

  end

  describe "relationships" do

    it " belongs to one job" do
      comment = create(:comment)
      expect(comment).to respond_to(:jobs)
    end
  end
end
