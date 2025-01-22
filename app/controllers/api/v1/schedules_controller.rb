class Api::V1::SchedulesController < ApplicationController
  
  def index
    schedules = Schedule.all()
    render json: ScheduleSerializer.all_schedules(schedules)
  end

  def show
    schedule = Schedule.includes(:user, :show).where(user_id: params[:id])
    render json: ScheduleSerializer.show_schedule(schedule)
  end

  def create
    schedule = Schedule.new(schedule_params)
    render json: schedule, status: :created
  end

  private

  def schedule_params
    params.permit(:title, :date, :user_id, :show_id)
  end
end