module ApplicationHelper
  def small_form?
    ['sessions', 'passwords', 'customers', 'answers'].include?(controller_name) ||
    (['registrations'].include?(controller_name) && ['new', 'create'].include?(action_name))
  end

  def comment_or_answer?
    parent.main_question ? parent.main_question : 'Comment'
  end

  def show_comment?
    parent.main_question && action_name == 'new' || !parent.main_question && action_name == 'edit'
  end
end
