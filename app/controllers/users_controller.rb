class UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
    render :layout => 'admin_application'
  end

  def edit
  end
end
