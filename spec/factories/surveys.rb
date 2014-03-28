FactoryGirl.define do
  factory :survey do
    introductory_text     Faker::Lorem.paragraph
    goodbye_message       Faker::Lorem.paragraph

    company
  end
end
