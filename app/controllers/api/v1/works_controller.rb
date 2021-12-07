class Api::V1::WorksController < ApplicationController
  def create
    User.transaction do
      @work = Work.new(work_params)
      @work.time_caliculator
      @work.hourly_wage = 1000
      # @work.hourly_wage = current_user.current_hourly_wage
      # User機能実装したらこれを使用する。
    end
    Task.transaction do
      @task = Task.find_by(task_params)
      @task.add_total_data(@work)
    end
    # rescue => e
    if @work.save && @task.save
      render json: { work: @work, task: @task }
    else
      render json: @work.errors, status: :bad_request
    end
  end

  private

  def work_params
    # binding.pry
    params.require(:work).permit(:start_at, :end_at, :task_id)
  end

  def task_params
    params.require(:task).permit(:id)
  end
end
