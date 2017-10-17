FactoryGirl.define do
  factory :contact do
    sequence(:first_name) {|n| "First name #{n}"}
    sequence(:last_name) {|n| "Last name #{n}"}
    sequence(:email) {|n| "Email Address #{n}"}
    sequence(:position) {|n| "Position #{n}"}
    company
  end

end
