class StatisticsController < ApplicationController
  respond_to :json

  def morris
    respond_to do |format|
      format.json do
        render :json => [Statistic.new(question).morris, labels]
      end
    end
  end

  def donut
    respond_to do |format|
      format.json do
        render :json => Statistic.new(question).donut
      end
    end
  end

private

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
