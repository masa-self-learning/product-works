class UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
    render :layout => 'admin_application'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: '更新に成功しました'
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, notice: '削除しました'
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_no, :email)
  end
end


