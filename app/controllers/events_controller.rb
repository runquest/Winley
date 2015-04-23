class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      current_user.events << @event
      redirect_to event_path(@event), notice: "#{@event.title}!"
    else
      render :new
    end
  end

  def show
     @event = Event.find(params[:id])     
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root
  end

  def edit
      @event = Event.find(params[:id])
  end

   def update
    @event = Event.find(params[:id])

    if @event.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end 

  protected

  def event_params
    params.require(:event).permit(:title, :venue, :date, :duration, :description)
  end

end
