class WorksController < ApplicationController
  before_action :authenticate_user!
  def index
    user = User.find(1)
    @works = user.works.order(date: 'ASC')

    @today = Date.today

    #当月か選択月を変数に代入
    if params[:date]
      @yyyymm = params[:date]
    else
      @yyyymm = Date.today.strftime('%Y/%m')
    end

    # 1ヶ月分の日数
    @days = Array(("#{@yyyymm}-01").to_date.all_month).size

    # モーダルの自動表示判定
    @modal_view_flg = true

    # 
    if @work = Work.find_by(date: "#{@today.to_date}")
      @modal_start_time = @work.start_time.strftime('%H:%M') if @work.start_time != nil
      @modal_end_time = @work.end_time.strftime('%H:%M') if @work.end_time != nil
      @modal_break_time = @work.break_time
      @modal_comment = @work.comment
      
      # モーダルの自動表示判定
      @modal_view_flg = false if @modal_start_time && @modal_end_time
    else
      @work = Work.new
      @modal_start_time = ""
      @modal_end_time = ""
      @modal_break_time = "01:00"
      @modal_comment = ""
    end

  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.user_id = current_user.id
    if @work.save
      redirect_to works_path, notice: '登録に成功しました'
    else
      render :index
    end
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to works_path, notice: '更新に成功しました'
    else
      render :index
    end
  end


  private
    def work_params
      params.require(:work).permit(:user_id, :date, :start_time, :end_time, :break_time, :comment)
    end
end

