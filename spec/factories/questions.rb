FactoryGirl.define do
  factory :question do
    description           Faker::Lorem.sentence
    type_answer           'Scale'
    survey
  end
end
