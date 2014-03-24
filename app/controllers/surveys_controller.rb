class SurveysController < InheritedResources::Base
  before_filter :authenticate_company!
  before_action :protect_survey_ownership!, only: [:edit]

  def index
    @surveys = current_company.surveys.paginate(:page => params[:page], :per_page => per_page)
  end

  def create
    @survey = Survey.new(resource_params)
    @survey.company_id = current_company.id
    create! { collection_url }
  end

  def update
    update! { collection_url }
  end



  def collection
    get_collection_ivar || set_collection_ivar(end_of_association_chain.paginate(:page => params[:page], :per_page => per_page))
  end

  def per_page
    6
  end

  protected

  def resource_params
    params.require(:survey).permit(:introductory_text, :goodbye_message, :max_questions, :main_question, :company_id)
  end

  def protect_survey_ownership!
    redirect_to(root_path) unless resource.company == current_company
  end
end
