FactoryGirl.define do
  factory :pledge do
    dollar_amount 9.99
    user
    project

  end
end
