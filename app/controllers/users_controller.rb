class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    render :layout => 'admin_application'
  end

  def show
  end

  def edit
  end
end
