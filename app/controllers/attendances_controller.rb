class AttendancesController < ApplicationController

  def new
    @event = Event.find(params[:id])
  end

  def create
    # if payment = true
    #   redirect_to event_path(params[:id])
    # else
    #   render 
    # end
  end

  def index
    @event = Event.where(id:params[:id])
    @attendance = Attendance.where(event:@event)
  end

end
