class Customer < ActiveRecord::Base
  belongs_to :survey
  has_many :answers

  after_create :set_next_group

  private

  def set_next_group
    if survey.max_questions
      self.update_attributes(next_group: SurveyUtil.new(self.survey).next_group)
      self.survey.update_attributes(next_group: next_group)
    end
  end
end
