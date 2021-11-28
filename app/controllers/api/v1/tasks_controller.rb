class Api::V1::TasksController < ApplicationController
  def index
    @tasks = Task.all
    render json: @tasks
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = 1

    if @task.save
      render json: @task
    else
      render json: @task.errors, status: :bad_request
    end
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end
