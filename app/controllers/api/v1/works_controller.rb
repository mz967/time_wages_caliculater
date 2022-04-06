class Api::V1::WorksController < ApplicationController
  before_action :set_work, only: %i[update destroy]
  before_action :task_find, only: %i[destroy index]

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
    @task.reset_total_data(@work)
    @task.save
    @work.destroy!
    render json: @task
  end

  def index
    @works = @task.works
    # 日別のデータを送るための作業↓↓↓すべて1日ごとでまとめる
    @work_days = @works.group('date(start_at)').sum(:start_at).map { |key, _| key }
    @daily_wages = @works.group('date(start_at)').sum(:work_wage).map { |_, val| val }
    @daily_evaluated_wages = @works.group('date(start_at)').sum(:evaluation).map { |_, val| val }
    @daily_works = @work_days.zip(@daily_wages, @daily_evaluated_wages)
    # 月別のデータを送るための作業↓↓↓すべて1月ごとでまとめる
    @work_months = @works.group("DATE_FORMAT(start_at, '%Y-%m')").sum(:start_at).map { |key, _| key }
    @monthly_wages = @works.group('month(start_at)').sum(:work_wage).map { |_, val| val }
    @monthly_evaluated_wages = @works.group('month(start_at)').sum(:evaluation).map { |_, val| val }
    @monthly_works = @work_months.zip(@monthly_wages, @monthly_evaluated_wages)
    render json: {
      daily_works: @daily_works,
      monthly_works: @monthly_works
    }
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_find
    @task = Task.find_by(id: params[:task_id])
  end

  def work_params
    params.require(:work).permit(:start_at, :end_at, :task_id)
  end

  def task_params
    params.require(:task).permit(:id)
  end
end
