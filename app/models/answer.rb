class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :customer

  delegate :description, to: :question, prefix: true
  delegate :type_answer, to: :question, prefix: true

  HAPPY_LEVEL = ['Satisfied', 'Neutral', 'Unsatisfied']
  YES_OR_NOT  = ['Yes', 'Not']

  scope :satisfied,   -> { where(happy_level: 'Satisfied') }
  scope :neutral,     -> { where(happy_level: 'Neutral') }
  scope :unsatisfied, -> { where(happy_level: 'Unsatisfied') }
  scope :yes,         -> { where(yes_or_not: 'Yes') }
  scope :not,         -> { where(yes_or_not: 'Not') }
  scope :total_scale, -> { sum(:scale) }
end
