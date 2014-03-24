class CustomersController < InheritedResources::Base
  belongs_to :survey

  # def create
  #   create! { new_customer_answer_url(resource) }
  # end

  def more_feedback

  end

  def create
    super do |format|
      format.html do
        if parent.main_question
          render action: 'more_feedback'
        else
          redirect_to new_customer_answer_url(resource)
        end
      end
    end
  end


private
  def resource_params
    params.require(:customer).permit(:name, :sex, :comment, :survey_id)
  end
end
