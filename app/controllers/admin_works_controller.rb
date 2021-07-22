class AdminWorksController < ApplicationController
  before_action :authenticate_user!

  layout 'admin_application'
  def index
  end
end
