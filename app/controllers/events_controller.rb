class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @flight = @event.flights.new
  end

  def create
    @event = Event.new(event_params)
    
    if @event.save

      if current_user == nil
        redirect_to event_path(@event), notice: "#{@event.title}!"
      else
        current_user.events << @event
        redirect_to event_path(@event), notice: "#{@event.title}!"
      end
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
  @bottle = @event.bottles.new
end

def update
  @event = Event.find(params[:id])
  current_user.events << @event if current_user
  if @event.update_attributes(event_params)
    redirect_to event_path, notice: "#{@event.title}!"
  else
    render :edit
  end
end 

def delete_bottle
  e = Event.find(params[:event_id])
  f = Flight.find(params[:flight_id]).destroy
  # e.bottles.find(params[:bottle_id]).destroy
  redirect_to event_path(e)
end

protected

def event_params
  params.require(:event).permit(:title, :venue, :date, :duration, :event_image, :description, bottle_ids:[], flights_attributes:[:bottle_id])
end



end
