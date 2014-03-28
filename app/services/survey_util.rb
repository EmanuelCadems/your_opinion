class SurveyUtil
  attr_accessor :survey

  def initialize(survey)
    self.survey   = survey

  end

  def next_question(customer)
    return unless question_id(customer)
    Question.find(question_id(customer))
  end

  def next_question_for_customer(customer)
    return unless question_id_for_customer(customer)
    Question.find(question_id_for_customer(customer))
  end

  def next_group
    return unless max_questions
    limit = group_questions.count
    survey.next_group == (limit - 1) ? 0 : survey.next_group += 1
  end

private
  def max_questions
    survey.max_questions
  end

  def questions_ids
    survey.questions.pluck(:id)
  end

  def group_questions
    questions_ids.in_groups_of(max_questions)
  end
  def next_group_ids(index)
    return unless max_questions
    (group_questions[index]).compact
  end

  def question_id(customer)
    available_questions_id = (max_questions ? next_group_ids(survey.next_group) : questions_ids)
    if survey.answers
      available_questions_id -= survey.answers.where(customer_id: customer).pluck(:question_id)
    end
    available_questions_id.pop
  end

  def question_id_for_customer(customer)
    available_questions_id = (max_questions ? next_group_ids(customer.next_group) : questions_ids)
    if survey.answers
      available_questions_id -= survey.answers.where(customer_id: customer).pluck(:question_id)
    end
    available_questions_id.pop
  end
end
