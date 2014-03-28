class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :customer

  delegate :description, to: :question, prefix: true
  delegate :type_answer, to: :question, prefix: true

  HAPPY_LEVEL = ['Satisfied', 'Neutral', 'Unsatisfied']
end
