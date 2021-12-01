class Api::V1::WorksController < ApplicationController
  def create
    @work = Work.new(work_params)
    @task = Task.find_by(task_params)
    @work.work_time = @work.end_at - @work.start_at
    @work.hourly_wage = 1000
    # @work.hourly_wage = current_user.current_hourly_wage
    # binding.pry
    @task.total_time += @work.work_time
    @task.total_wage += (@work.hourly_wage * @work.work_time / 60 / 60).floor
    if @work.save && @task.save
      render json: { work: @work, task: @task }
    else
      render json: @work.errors, status: :bad_request
    end
  end

  private

  def work_params
    params.require(:work).permit(:start_at, :end_at, :task_id)
  end

  def task_params
    params.require(:task).permit(:id)
  end
end
