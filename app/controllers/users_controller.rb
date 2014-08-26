class UsersController < ApplicationController
  before_action :set_resource, only: [:index, :edit, :update]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      # @user.roles.delete_all
      # (params[:role_id] || []).each { |i| @user.roles << Role.find(i) }
      redirect_to users_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @user = case action_name
      when 'index' then User.new
      when 'edit', 'update' then User.find(params[:id])
      end
      raise 'error' unless @user.cando?(action_name, current_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :avatar, :avatar_cache, user_roles_attributes: [:id, :role_id] )
    end
end
