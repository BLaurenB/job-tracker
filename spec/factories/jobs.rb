FactoryGirl.define do
  factory :job do
    sequence(:title) {|n| "Job Title #{n}"}
    sequence(:description) {|n| "Job Description #{n}"}
    sequence(:level_of_interest) {|n| "Interest #{n}"}
    sequence(:city) {|n| "Job City #{n}"}
    company
  end

end
