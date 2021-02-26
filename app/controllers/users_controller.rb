class UsersController < ApplicationController

  def index
    @user = User.new
    @users = User.all
  end

  def create
    User.invite!(params.require(:user).permit(:email))

    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!

    redirect_to users_path
  end
end
