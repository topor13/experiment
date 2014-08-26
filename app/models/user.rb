class User < ActiveRecord::Base
	has_many :comments, -> { uniq }
  has_many :posts, -> { uniq }
  has_many :user_roles
  has_many :roles, through: :user_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  accepts_nested_attributes_for :user_roles

  ## etc
  def cando?(action_name, current_user, *params)
    case action_name
    when 'index' then current_user && current_user.roles.where(name: 'admin').exists? ? true : false
    when 'edit', 'update' then current_user && (current_user.roles.where(name: 'admin').exists? || current_user.id == self.id) ? true : false
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
