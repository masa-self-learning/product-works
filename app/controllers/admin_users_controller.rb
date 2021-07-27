class AdminUsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = Admin.all
    render :layout => 'admin_application'
  end
end
