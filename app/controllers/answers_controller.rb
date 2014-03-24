class AnswersController < ApplicationController

  before_action :load_resources

  def new
    if @question
      @answer   = @question.answers.new(params[:answer])
    else
      redirect_to new_survey_customer_url(@customer.survey), alert: "This survey already was answered"
    end
  end

  def create
    answer = Answer.new(answer_params)
    answer.customer = @customer
    answer.question = @question
    answer.save

    if SurveyUtil.new(@customer.survey, @customer).next_question
      redirect_to new_customer_answer_url(@customer)
    else
      redirect_to edit_survey_customer_path(@customer.survey, @customer)
    end
  end

private
  def load_resources
    @customer = Customer.find(params[:customer_id])
    @question = SurveyUtil.new(@customer.survey, @customer).next_question
  end

  def answer_params
    params.require(:answer).permit(:scale, :yes, :happy_level,:question_id, :customer_id)
  end

end
