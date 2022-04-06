class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: %i[show update destroy reset]

  def index
    @tasks = Task.where(user_id: current_user.id)
    render json: @tasks
  end

  def show
    render json: @task
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      render json: @task
    else
      render json: @task.errors, status: :bad_request
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :bad_request
    end
  end

  def destroy
    @task.destroy!
    render json: @task
  end

  def reset
    @task.total_time = 0
    @task.total_wage = 0
    @task.save
    @task.works.destroy_all
    # @works = @task.works
    # @works.destroy_all
    render json: @task
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :total_time, :total_wage)
  end
end
