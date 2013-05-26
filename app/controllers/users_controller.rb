class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: :show

  # GET /users
  def index
    render json: current_user
  end

  # GET /users/1
  def show
    render json: @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:instance_id, :name, :public_ip, :private_ip, :flavor, :image, :ssh_key_name, :security_groups, :state)
    end
end
