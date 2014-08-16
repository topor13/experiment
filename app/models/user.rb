class User < ActiveRecord::Base
	has_many :comments, -> { uniq }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def downcase_email
  	self.email.downcase
  end
end
