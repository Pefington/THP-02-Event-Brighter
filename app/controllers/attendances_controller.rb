class AttendancesController < ApplicationController

  def index
    @event = Event.find(params[:id])
    @attendees = Attendance.where(event:@event)
  end

  def new
    @event = Event.find(params[:id])
  end

  def create
    # if payment == true
    #   redirect_to event_path(params[:id])
    # else
    #   render 
    # end
  end

end
