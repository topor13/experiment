class User < ActiveRecord::Base
	has_many :comments, -> { uniq }
  has_many :posts, -> { uniq }
  has_many :user_roles
  has_many :roles, through: :user_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def cando?(action_name, current_user, user, *params)
    case action_name
    when 'index', 'edit', 'update' then (current_user && current_user.roles.where(name: 'admin')) ? true : false
    else false
    end
  end
  def downcase_email
  	self.email.downcase
  end
  def downcase_name
  	self.name.downcase
  end
end
