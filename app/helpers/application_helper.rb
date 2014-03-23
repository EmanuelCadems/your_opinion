module ApplicationHelper
  def small_form?
    ['sessions', 'passwords'].include?(controller_name) ||
    (['registrations'].include?(controller_name) && ['new', 'create'].include?(action_name))
  end
end
