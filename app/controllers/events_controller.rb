class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new show create]

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
    if @event.update(
      description: params[:description],
      start_date: params[:start_date],
      duration: params[:duration],
      location: params[:location],
      price: params[:price]
    )
      flash[:success] = 'You have successfully created a new event'
      redirect_to event_path(@event.id)
    else
      @event.errors.full_messages.each { |m| flash.now[:alert] = m }
      render edit_event_path(@event.id)
    end
  end

  def update

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
      @event.errors.full_messages.each { |m| flash.now[:alert] = m }
      render new_event_path
    end
  end

  def destroy
    @event = Event.find_by_id(params[:id])
    @event.destroy
    flash[:success] = 'The gossip was destroyed'
    redirect_to event_index_path
  end
end
