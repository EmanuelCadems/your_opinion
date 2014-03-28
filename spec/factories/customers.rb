FactoryGirl.define do
  factory :customer do
    name                  Faker::Name.name
    sex                   'Male'
    comment               Faker::Lorem.paragraph
    survey
  end
end
