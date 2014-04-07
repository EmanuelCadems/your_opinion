#encoding=utf-8
namespace :db do
  desc "Task to populate the database with sample data."
  task :populate => :environment do
    Company.destroy_all
    Survey.destroy_all
    Question.destroy_all

    introductory_text = 'Thank you very much for choosing us. Please help us improve. Your opinion is important to us. The next survey will take no more than 5 min.'
    goodbye_message   = 'Thank you very much for helping. We will continually work to improve the quality of our services.'

    airline = Company.create(email: 'airline@gmail.com', password: '123123123', password_confirmation: '123123123', name: 'Airline')

    survey_airline = Survey.create(max_questions: 5, introductory_text: introductory_text, goodbye_message: goodbye_message, company: airline)
    Question.create!(description: 'Are you happy with the service?' , type_answer: 'Happy Level', survey: survey_airline)
    Question.create!(description: 'Was the waiting time OK?' , type_answer: 'Happy Level', survey: survey_airline)
    Question.create!(description: 'Are you happy with the ground staff?' , type_answer: 'Happy Level', survey: survey_airline)
    Question.create!(description: 'Did you use the online check-in service?', type_answer: 'Yes Or Not', survey: survey_airline)
    Question.create!(description: 'How would you rate the punctuality of your flight?' , type_answer: 'Happy Level', survey: survey_airline)
    Question.create!(description: 'How satisfied are you with the onboard crew?' , type_answer: 'Happy Level', survey: survey_airline)
    Question.create!(description: 'Have you heard about our last-minute offers?', type_answer: 'Yes Or Not', survey: survey_airline)
    Question.create!(description: 'How do you rate the airplane cabin?', type_answer: 'Scale', survey: survey_airline)
    Question.create!(description: 'Have you used our in-cabin entertainment systems?', type_answer: 'Yes Or Not', survey: survey_airline)
    Question.create!(description: 'Have you bought any item in-flight?', type_answer: 'Yes Or Not', survey: survey_airline)
    Question.create!(description: 'Do you know about our new tourist-plus class?', type_answer: 'Yes Or Not', survey: survey_airline)
    Question.create!(description: 'Are you travelling for business?', type_answer: 'Yes Or Not', survey: survey_airline)
    Question.create!(description: 'How would you rate us?', type_answer: 'Scale', survey: survey_airline)

    restaurant = Company.create(email: 'restaurant@gmail.com', password: '123123123', password_confirmation: '123123123', name: 'Restaurant')

    survey_restaurant = Survey.create(main_question: 'What can we do better?', introductory_text: introductory_text, goodbye_message: goodbye_message, company: restaurant)

    Question.create!(description: 'How good was the food?', type_answer: 'Scale', survey: survey_restaurant)
    Question.create!(description: 'How are the premises?', type_answer: 'Happy Level', survey: survey_restaurant)
    Question.create!(description: 'Are you happy with the service?', type_answer: 'Happy Level', survey: survey_restaurant)
    Question.create!(description: 'Would you come back?', type_answer: 'Yes Or Not', survey: survey_restaurant)

    Customer.destroy_all
    Answer.destroy_all
  end
end
