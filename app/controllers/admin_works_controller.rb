class AdminWorksController < ApplicationController
  before_action :authenticate_admin!

  layout 'admin_application'
  def index
    @user = User.find(params[:id])
    @works = @user.works.order(date: 'ASC')

    @today = Date.today

    #当月か選択月を変数に代入
    if params[:date]
      @yyyymm = params[:date]
    else
      @yyyymm = Date.today.strftime('%Y/%m')
    end

    # 1ヶ月分の日数
    @days = Array(("#{@yyyymm}-01").to_date.all_month).size

    # 詳細モーダルの変数用
    @work = Work.new
    @modal_start_time = ""
    @modal_end_time = ""
    @modal_break_time = "01:00"
    @modal_comment = ""
  end

  def new
    @work = Work.new
  end

  def create

    @work = Work.new(work_params)
    date = @work.date.strftime('%Y-%m')
    user_id = @work.user_id

    if @work.save
      redirect_to admin_works_path(date: date, id: user_id), notice: '登録に成功しました'
    else
      redirect_to admin_works_path(date: date, id: user_id), notice: '登録に失敗しました'
    end
  end

  def edit
    @user = User.find(params[:user_id])

    # 当日データの有無の確認
    if @work = @user.works.find_by(date: params[:id])
      @date = @work.date
      @modal_start_time = @work.start_time.strftime('%H:%M') if @work.start_time != nil
      @modal_end_time = @work.end_time.strftime('%H:%M') if @work.end_time != nil
      @modal_break_time = @work.break_time
      @modal_comment = @work.comment
    else
      @work = Work.new
      @date = params[:id].to_date
      @modal_start_time = ""
      @modal_end_time = ""
      @modal_break_time = "01:00"
      @modal_comment = ""
    end
  end

  def update
    @work = Work.find(params[:id])
    date = @work.date.strftime('%Y-%m')
    user_id = @work.user_id

    if @work.update(work_params)
      redirect_to admin_works_path(date: date, id: user_id), notice: '更新に成功しました'
    else
      redirect_to admin_works_path(date: date, id: user_id), notice: '更新に失敗しました'
    end
  end

  private
  def work_params
    params.require(:work).permit(:user_id, :date, :start_time, :end_time, :break_time, :comment)
  end
end

