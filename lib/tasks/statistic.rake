#encoding=utf-8
namespace :statistic do
  desc "Task to populate the database with sample data."
  task :load => :environment do
    Survey.all.each do |survey|
      FactoryGirl.create_list(:customer, 100, survey: survey, name: Faker::Name.name, sex: ['Male', 'Female'].sample)
    end

    range_date = (10.days.ago.to_date.to_s..Date.today.to_s).select{|x| Date.parse(x) rescue nil}

    Customer.all.each do |customer|
      customer.survey.questions.each do |question|
        answer = Answer.new(
          customer: customer,
          question: question,
          created_at: range_date.sample
          )

        case question.type_answer
        when 'Scale'
          answer.scale = Array(1..5).sample
        when 'Happy Level'
          answer.happy_level = Answer::HAPPY_LEVEL.sample
        when 'Yes Or Not'
          answer.yes_or_not = Answer::YES_OR_NOT.sample
        end
        answer.save
      end
    end
  end
end
