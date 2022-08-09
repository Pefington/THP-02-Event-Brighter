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
      title: params[:event_title],
      description: params[:event_description],
      start_date: params[:event_start_date],
      duration: params[:event_duration],
      location: params[:event_location],
      price: params[:event_price]
    )
    @event.admin = current_user
    if @event.save
      flash[:success] = 'You have successfully created a new event'
      redirect_to event_path(Event.last.id)
    else
      flash[:error] = @event.errors.each { |m| puts m }
      render new_event_path
    end
  end
end
