FactoryGirl.define do
  factory :company do
    name                  Faker::Company.name
    sequence(:email)      { |n| "company#{n}@gmail.com" }

    password              "123123123"
    password_confirmation "123123123"
  end
end
