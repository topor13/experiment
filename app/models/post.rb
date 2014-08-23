class Post < ActiveRecord::Base
	## relations
  has_many :comments
  belongs_to :user

  # after_create :first_comment

  ## etc
  def cando?(action_name, current_user, post, *params)
    case action_name
    when 'index', 'show' then true
    when 'new', 'create', 'update', 'destroy' then current_user ? (current_user.roles.each { |role| role.name.include?('author') } ) : false
    when 'edit' then (current_user && current_user.id == post.user.id) ? true : false
    else false
    end
  end

  # private
  #   def first_comment
  #     self.comment.create(text)      
  #   end
end