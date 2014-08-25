class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  ## etc
  def cando?(action_name, current_user, comment, *params)
    case action_name
    when 'show' then true
    when 'create' then current_user ? true : false
    when 'destroy' then (current_user && ((current_user.id == comment.user.id) || (current_user.id == comment.post.user.id))) ? true : false
    else false
    end
  end
end
