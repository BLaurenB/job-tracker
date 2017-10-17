FactoryGirl.define do
  factory :comment do
    sequence(:content) {|n| "Comment content #{n}"}
    job
  end

end
