class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers

  TYPE_ANSWERS = ['Scale', 'Yes Or Not', 'Happy Level']

  validates :type_answer,
    :inclusion  => { :in => TYPE_ANSWERS,
    :message    => "%{value} is not a valid type answer" }

  validates :description, presence: true


  def case_answer(happy_level, yes_or_not, scale)
    result = case type_answer
    when 'Happy Level'
      happy_level.call
    when 'Yes Or Not'
      yes_or_not.call
    when 'Scale'
      scale.call
    end
  end
end
