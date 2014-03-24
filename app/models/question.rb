class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers

  TYPE_ANSWERS = ['Scale', 'Yes Or Not', 'Happy Level']

  validates :type_answer,
    :inclusion  => { :in => TYPE_ANSWERS,
    :message    => "%{value} is not a valid type answer" }

  validates :description, presence: true
end
