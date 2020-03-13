# frozen_string_literal: true

# My comment

class AttendancesController < ApplicationController
  def create
    @user = current_user
    @events = Event.find(params[:id])
    @attendance = Attendance.new(user: @user, event: @event)

    redirect_to @events
  end
end
