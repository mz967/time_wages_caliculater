class Api::V1::WorksController < ApplicationController
  before_action :set_work, only: %i[update destroy]

  def create
    ActiveRecord::Base.transaction do
      @work = Work.new(work_params)
      @work.time_caliculator
      @work.hourly_wage = current_user.current_hourly_wage
      @work.wage_caliculator
      @work.save
      @task = Task.find_by(task_params)
      @task.add_total_data(@work)
      @task.save
    end
    render json: { work: @work, task: @task }
  rescue StandardError
    render json: @work.errors, status: :bad_request
  end

  def update
    @task = Task.find_by(task_params)
    if @work.update(params.require(:work).permit(:evaluation))
      render json: @work
    else
      render json: @work.errors, status: :bad_request
    end
  end

  def destroy
    @work.destroy!
    render json: @work
  end

  def index
    @task = Task.find_by(id: params[:task_id])
    @works = @task.works
    # 日別のデータを送るための作業
    @work_daily_wages = Work.work_date.sum(:work_wage)
    @evaluated_daily_wages = Work.work_date.sum(:evaluation)
    # @work_daily_wages = Work.where(created_at: Time.current.beginning_of_month..Time.current.end_of_month).group('date(created_at)').sum(:work_wage)
    # @evaluated_daily_wages = Work.where(created_at: Time.current.beginning_of_month..Time.current.end_of_month).group('date(created_at)').sum(:evaluation)
    @work_days = @work_daily_wages.map { |key, _| key.strftime('%m/%d') }
    @daily_wages = @work_daily_wages.map { |_, val| val }
    @daily_evaluated_wages = @evaluated_daily_wages.map { |_, val| val }

    # 月別のデータを送るための作業
    @work_monthly_wages = Work.work_month.sum(:work_wage)
    @evaluated_monthly_wages = Work.work_month.sum(:evaluation)
    # @work_monthly_wages = Work.where(created_at: Time.current.beginning_of_year..Time.current.end_of_year).group('month(created_at)').sum(:work_wage)
    # @evaluated_monthly_wages = Work.where(created_at: Time.current.beginning_of_year..Time.current.end_of_year).group('month(created_at)').sum(:evaluation)
    @work_months = @work_monthly_wages.map { |key, _| "#{key}月" }
    @monthly_wages = @work_monthly_wages.map { |_, val| val }
    @monthly_evaluated_wages = @evaluated_monthly_wages.map { |_, val| val }

    render json: {
      daily_wages: @daily_wages,
      work_days: @work_days,
      daily_evaluated_wages: @daily_evaluated_wages,
      monthly_wages: @monthly_wages,
      work_months: @work_months,
      monthly_evaluated_wages: @monthly_evaluated_wages
    }
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def work_params
    params.require(:work).permit(:start_at, :end_at, :task_id)
  end

  def task_params
    params.require(:task).permit(:id)
  end
end
