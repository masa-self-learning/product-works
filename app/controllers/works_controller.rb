class WorksController < ApplicationController
  before_action :authenticate_user!

  def index
    
    # 社員のみ利用する為、current_user。他社員へのアクセス権限なし。
    @user = User.find(current_user.id)
    @works = @user.works.order(date: 'ASC')

    # 当日の日付
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

    # 当日データの有無の確認
    if @work = @user.works.find_by(date: "#{@today.to_date}")
      @modal_start_time = @work.start_time.strftime('%H:%M') if @work.start_time != nil
      @modal_end_time = @work.end_time.strftime('%H:%M') if @work.end_time != nil
      @modal_break_time = @work.break_time
      @modal_comment = @work.comment

      # モーダルの自動表示判定
      @modal_view_flg = false if @modal_start_time
      #出勤未打刻アラート
      @alert_msg = "出勤打刻を押してください" if !@modal_start_time
    else
      @work = Work.new
      @modal_start_time = ""
      @modal_end_time = ""
      @modal_break_time = "01:00"
      @modal_comment = ""

      #出勤未打刻アラート
      @alert_msg = "出勤打刻を押してください"
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    date = @work.date.strftime('%Y-%m')
    @work.user_id = current_user.id

    if @work.save
      redirect_to works_path(date: date), notice: '登録に成功しました'
    else
      redirect_to works_path(date: date), notice: '登録に失敗しました'
    end
  end

  def edit
    @user = User.find(current_user.id)
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

    if @work.update(work_params)
      redirect_to works_path(date: date), notice: '更新に成功しました'
    else
      redirect_to works_path(date: date), notice: '更新に失敗しました'
    end
  end

  private
    def work_params
      params.require(:work).permit(:user_id, :date, :start_time, :end_time, :break_time, :comment)
    end
end

