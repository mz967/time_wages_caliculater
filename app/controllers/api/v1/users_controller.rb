class Api::V1::UsersController < ApplicationController
  before_action :authenticate!, only: %i[me]

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: user.errors, status: :bad_request
    end
  end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:current_hourly_wage))
      render json: @task
    else
      render json: @task.errors, status: :bad_request
    end
  end

  def me
    render json: current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :current_hourly_wage)
  end
end
