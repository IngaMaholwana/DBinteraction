class AttendanceController < ApplicationController
  def create
    @attendance = Attendance.new(event: Event.find_by(id: params[:id]), user: current_user)
    if @attendance.save
      redirect_to @attendance.event, notice: "You have been added"
    else
      redirect_to @attendance.event, alert: "Failed to join the event!"
    end
  end

  def delete
    @attendance = Attendance.find_by(event: Event.find_by(id: params[:id]), user: current_user)
    if @attendance.delete
      redirect_to @attendance.event, notice: "You're out!"
    else
      redirect_to @attendance.event, alert: "Failed to leave!"
    end
  end
end