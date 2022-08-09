class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new show create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @count = Attendance.where(event: @event).count
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(
      title: title,
      description: description,
      start_date: start_date,
      duration: duration,
      location: location,
      price: price
    )
    @event.admin = User.find_by(id: session[:user_id])
    if @event.save
      flash.now[:success] = "You have successfully created a new event"
      redirect_to event_path(Event.last.id)
    else
      flash.now[:alert] = "Some information seem missing or incomplete. Please try again."
      render new_event_path
    end
  end


end
