class SurveyUtil
  attr_accessor :survey, :customer

  def initialize(survey, customer)
    self.survey = survey
    self.customer = customer
  end

  def next_question
    return unless question_id
    Question.find(question_id)
  end

private
  def question_id
    available_questions_id = self.survey.questions.pluck(:id)
    if survey.answers
      available_questions_id -= survey.answers.where(customer_id: customer).pluck(:question_id)
    end
    available_questions_id.pop
  end
end
