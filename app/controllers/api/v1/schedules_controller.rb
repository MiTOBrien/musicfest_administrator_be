class Api::V1::SchedulesController < ApplicationController
  
  def index
    schedules = Schedule.pluck('title', 'date').uniq
    render json: ScheduleSerializer.all_schedules(schedules)
  end

  def show
    user_id = params[:id]
    user = User.find_by(id: user_id)
    name = "#{user.first_name} #{user.last_name}"
    schedule = Schedule.where(user_id: user_id).select(:title, :date)
    render json: { user_name: name, schedules: schedule }
  end

  def create
    schedule = Schedule.new(schedule_params)
    render json: schedule, status: :created
  end

  def destroy
    schedule = Schedule.find_by(id: params[:id])
    schedule.destroy
    Render json: { message: "Schedule successfully deleted."}, status: :ok
  end

  private

  def schedule_params
    params.permit(:title, :date, :user_id, :show_id)
  end
end