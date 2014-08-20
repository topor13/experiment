class Post < ActiveRecord::Base
	## relations
  has_many :comments

  ## etc
  def cando?(action_name, current_user, *params)
    case action_name
    when 'index', 'show' then true
    when 'new', 'create', 'update', 'destroy' then current_user ? (current_user.roles.each { |role| role.name.include?('author') } ) : false
    else false
    end
  end
end
