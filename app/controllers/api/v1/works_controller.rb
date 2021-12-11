class Api::V1::WorksController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      @work = Work.new(work_params)
      @work.time_caliculator
      @work.hourly_wage = current_user.current_hourly_wage
      @work.save
      @task = Task.find_by(task_params)
      @task.add_total_data(@work)
      @task.save
    end
    render json: { work: @work, task: @task }
  rescue StandardError
    # errors << e.record.errors.full_messages.join
    render json: @work.errors, status: :bad_request
  end

  private

  def work_params
    params.require(:work).permit(:start_at, :end_at, :task_id)
  end

  def task_params
    params.require(:task).permit(:id)
  end
end
