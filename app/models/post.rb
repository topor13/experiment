class Post < ActiveRecord::Base
	## relations
  has_many :comments

  ## etc
  def cando?(action_name, current_user, *params)
    case action_name
    when 'index', 'show' then true
    when 'new', 'create', 'update', 'destroy', 'index' then current_user ? true : false
    else false
    end
  end
end
