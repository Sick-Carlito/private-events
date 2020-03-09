# frozen_string_literal: true

class EventsController < ApplicationController
  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.valid?
      @event.save
      @attendance = Attendance.new(user: current_user, event: @event)
      @attendance.save if @attendance.valid?
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @att = Attendance.where('event_id = ?', @event.id)
  end

  def index
    @events = Event.all
    @past_events = Event.past_events
    @upcoming_events = Event.upcoming_events
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date)
  end
end
