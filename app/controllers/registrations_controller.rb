class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    '/companies/edit'
  end

  def after_update_path_for(resource)
    edit_company_registration_path
  end
end
