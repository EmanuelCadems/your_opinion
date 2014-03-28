class CustomersController < InheritedResources::Base
  belongs_to :survey

  def more_feedback; end

  def create
    super do |format|
      format.html do
        if parent.main_question
          render 'more_feedback'
        else
          redirect_to new_customer_answer_url(resource)
        end
      end
    end
  end

  def update
    update! { root_url }
  end

private
  def resource_params
    params.require(:customer).permit(:name, :sex, :comment, :survey_id)
  end
end
