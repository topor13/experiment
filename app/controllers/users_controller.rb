class UsersController < ApplicationController
  before_action :set_resource, only: [:index, :edit, :update]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      @user.roles.delete_all
      (params[:role_id] || []).each { |i| @user.roles << Role.find(i) }
      redirect_to users_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @user = case action_name
      when 'index' then User.all
      when 'edit', 'update' then user = User.find(params[:id])
      end
      raise 'error' unless User.new.cando?(action_name, current_user, user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :role_id)
    end
end
