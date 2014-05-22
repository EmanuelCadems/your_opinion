class StatisticsController < ApplicationController
  respond_to :json

  def morris
    respond_to do |format|
      format.json do
        render :json => [call_service, labels]
      end
    end
  end

  def donut
    respond_to do |format|
      format.json do
        render :json => call_service
      end
    end
  end

private
  def call_service
    "#{type_answer}#{action_name.humanize}".constantize.new(question).result
  end

  def type_answer
    question.type_answer.dup.delete(" ")
  end

  def question
    Question.find(params[:question_id])
  end

  def labels
    case question.type_answer
    when 'Happy Level'
      ['Unsatisfied', 'Neutral', 'Satisfied']
    when 'Yes Or Not'
      ['Yes', 'Not']
    when 'Scale'
      ['Total']
    end
  end
end
