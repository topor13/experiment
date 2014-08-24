module ApplicationHelper
  def title
    current_user ? current_user.name.to_s : 'exp'
  end
end
