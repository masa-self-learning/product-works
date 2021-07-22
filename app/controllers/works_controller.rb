class WorksController < ApplicationController
  before_action :authenticate_user!
  def index
    user = User.find(1)
    @works = user.works.order(date: 'ASC')


    # @month = ("2021-01")
    if params[:date]
      @month = params[:date]
    else
      @month = Date.today.strftime('%Y/%m')
    end

    @date = ("#{@month}-01").to_date 
    @one_month_size = Array(@date.all_month).size

    @today = Date.today


  end
end
