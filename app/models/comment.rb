class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  ## etc
  def cando?(action_name, current_user, *params)
    case action_name
    when 'show' then true
    when 'create' then current_user ? true : false
    else false
    end
  end
end
