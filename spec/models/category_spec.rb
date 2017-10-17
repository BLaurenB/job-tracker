require 'rails_helper'

describe Category do

  describe "validations" do

    context "invalid attributes" do
      it "is invalid without a description" do
        category = Category.new()
        expect(category).to be_invalid
      end

    end

    context "valid attributes" do
      it "is valid with a description" do
        category = create(:category)
        expect(category).to be_valid
      end
    end

  end


  #Maybe this test belongs on jobs? Job can't be created unless it has a category?
  # describe "relationships" do
  #   it "job belongs to a category" do
  #     category = create(:category)
  #     job = create(:job)
  #     expect(job).to respond_to(:category)
  #   end
  # end

end
