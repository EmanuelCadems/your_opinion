YourOpinion::Application.routes.draw do
  devise_for :companies, :controllers => { :registrations => "registrations" }
  get "home/index"
  get "home/survey"
  get "home/question"
  get "statistics/morris"

  resources :surveys do
    resources :questions
    resources :customers do
      member do
        get 'more_feedback'
      end
    end
  end

  resources :customers do
    resources :answers
  end


  root to: "home#index"
end
