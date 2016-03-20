class EventsController < ApplicationController

  before_filter :restrict_access, :except => [:show, :index]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to event_path(@event)
  end

  def show
   @event = Event.find(params[:id])     
  end

  def destroy
    @event = Event.find(params[:id])
    @user = current_user
    @event.destroy
    flash[:notice] = "You just updated #{@event.title} event!"
    redirect_to user_path(@user)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to event_path(@event)
      flash[:notice] = "You just updated #{@event.title} event!"
    else
      render :edit
    end
  end 

  def add_bottle_to_event
    @event = Event.find(params[:id])

    params[:bottle_ids].each do |id|
      @event.bottles << Bottle.find(id)
    end

    redirect_to event_path(@event)
  end

  def remove_bottle_from_event
    @event = Event.find(params[:id])
    @event.bottles.delete(params[:bottle_id])
    redirect_to event_path(@event)
  end

  protected

  def event_params
    params.require(:event).permit(:user_id, :title, :venue, :date, :duration, :event_image, :description)
  end

end
