# frozen_string_literal: true

# My comment

class AttendancesController < ApplicationController
  def new; end

  def create
    @user = current_user
    @events = Event.find(params[:id])
    @attendance = Attendance.new(user: @user, event: @event)

    if @attendance.valid?
      @attendance.save
      flash[:alert] = 'You have successfully joined this event!!'
    else
      flash[:alert] = 'Joined an event already!!'
    end
    redirect_to @events
  end
end
