class QuestionsController < InheritedResources::Base
  before_filter :authenticate_company!
  before_action :protect_question_ownership!

  belongs_to :survey


  def create
    create! { collection_url }
  end

  def update
    update! { collection_url }
  end

  def resource_params
    params.require(:question).permit(:description, :type_answer, :survey_id)
  end

  # def collection
  #   get_collection_ivar || set_collection_ivar(end_of_association_chain.paginate(:page => params[:page], :per_page => per_page))
  # end

  def per_page
    6
  end

protected
  def protect_question_ownership!
    redirect_to(root_path) unless parent.company == current_company
  end
end
